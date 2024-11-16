import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_buy/blocs/auth_bloc/auth_bloc.dart';
import 'package:share_buy/blocs/cart_bloc/cart_event.dart';
import 'package:share_buy/blocs/cart_bloc/cart_state.dart';
import 'package:share_buy/enums/PayType.dart';
import 'package:share_buy/models/attribute/attribute_custom_value_model.dart';
import 'package:share_buy/models/cart/cart_model.dart';
import 'package:share_buy/models/order/order_model.dart';
import 'package:share_buy/models/product/product_model.dart';
import 'package:share_buy/models/shop/shop_model.dart';
import 'package:share_buy/repositories/cart_repository.dart';
import 'package:share_buy/repositories/product_repository.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState(product: ProductModel(shop: ShopModel()))) {
    on<UpdateQuantityCartItemEvent>(_updateQuantityProductToCart);
    on<CartLoadingEvent>(_loading);
    on<ChangeAttributeCartItemEvent>(_changeAttributeCartItem);
    on<EventSelectItemCartCheckbox>(_selectCartItem);
    on<EventPurchaseCart>(_purchaseCart);
    on<EventReLoadScreen>(_loadScreen);
    on<EventChangeQuantityProductSelected>(_changeQuantity);
    on<EventLoadingProductSelected>(_loadingProductSelected);
    on<EventProductSelectAttributeValue>(_selectAttributeValue);
    on<EventProductSelectAttributeValues>(_selectAttributeValues);
    on<EventResetProductSelected>(_resetProductSelected);
  }

  Future<void> _updateQuantityProductToCart(
      UpdateQuantityCartItemEvent event, Emitter emit) async {
    try {
      final bool isSuccues = await CartRepository().updateToCartById(
          cartItemId: event.cartItemId, quantity: event.quantity);
      if (isSuccues) {
        int indexCart = state.carts.indexWhere((cart) =>
            cart.cartItems
                ?.indexWhere((cartItem) => cartItem.id == event.cartItemId) !=
            -1);
        if (indexCart != -1) {
          int indexItem = state.carts[indexCart].cartItems!
              .indexWhere((element) => element.id == event.cartItemId);
          state.carts[indexCart].cartItems![indexItem].quantity =
              event.quantity;
          emit(state.copyWith(
              carts: state.carts,
              isUpdateCartItem: event.isBottomSheet ?? false));
        }
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false));
      log("Error when update quantity product to cart: $e");
    }
  }

  Future<void> _loading(CartLoadingEvent event, Emitter emit) async {
    try {
      emit(state.copyWith(isLoading: true, isSuccues: false));
      log("get me in cart screen ${AuthBloc.currentUser!.toJson()}");
      List<CartModel> carts = await CartRepository().getByUserId();
      // await Future.delayed(const Duration(seconds: 1));
      emit(state.copyWith(isLoading: false, carts: carts));
    } catch (e) {
      log("Error when get api cart by user id: $e");
      emit(state.copyWith(isLoading: false));
    }
  }

  void _changeAttributeCartItem(
      ChangeAttributeCartItemEvent event, Emitter emit) {
    if (state.productDetailId == event.productDetailId) {
      emit(state.copyWith(productDetailId: ''));
    } else {
      emit(state.copyWith(productDetailId: event.productDetailId));
    }
  }

  void _selectCartItem(EventSelectItemCartCheckbox event, Emitter emit) {
    try {
      if (event.type == TypeCheckBox.all) {
        state.carts.forEach((cart) {
          cart.shop!.isSelected = event.value;
          cart.cartItems!.forEach((cartItem) {
            cartItem.isSelected = event.value;
          });
        });
      } else if (event.type == TypeCheckBox.shop) {
        state.carts.every((cart) {
          if (cart.shop?.id == event.itemId) {
            cart.shop!.isSelected = event.value;
            cart.cartItems!.forEach((cartItem) {
              cartItem.isSelected = event.value;
            });
            log("Select shop: ${event.itemId}");
            return false;
          }
          return true;
        });
      } else {
        state.carts.every((cart) {
          return cart.cartItems!.every((cartItem) {
            if (cartItem.id == event.itemId) {
              cartItem.isSelected = event.value;
              //check all shop is selected
              cart.shop?.isSelected = cart.cartItems?.every((item) {
                return item.isSelected ?? false;
              });
              return false;
            }
            return true;
          });
        });
      }
      emit(state.copyWith(carts: state.carts));
    } catch (e) {
      log('Error when select cart item: $e');
    }
  }

  Future<void> _purchaseCart(EventPurchaseCart event, Emitter emit) async {
    try {
      emit(state.copyWith(isLoading: true));
      dynamic result = await CartRepository()
          .purchaseCart(carts: event.carts, payType: state.payType.displayName);

      if (result == false) {
        emit(state.copyWith(
            isLoading: false,
            isSuccues: false,
            isShowMessageToast: true,
            message: 'Đặt hàng thất bại'));
      } else if (result is OrderModel) {
        emit(state.copyWith(
            isLoading: false,
            isSuccues: true,
            isShowMessageToast: true,
            message: 'Đặt hàng thành công',
            payUrl: result.paymentInfo?.payUrl ?? ''));
      }
    } catch (e) {
      log('Error when purchase cart: $e');
      emit(state.copyWith(isLoading: false, isSuccues: false));
    }
  }

  void _loadScreen(EventReLoadScreen event, Emitter emit) {
    emit(state.copyWith(isLoading: false));
  }

  void _changeQuantity(EventChangeQuantityProductSelected event, Emitter emit) {
    log("Change quantity: ${event.quantity}");
    emit(state.copyWith(quantity: event.quantity));
  }

  Future<void> _loadingProductSelected(
      EventLoadingProductSelected event, Emitter emit) async {
    try {
      emit(state.copyWith(isLoading: true));
      ProductModel product =
          await ProductRepository().getById(productId: event.id);
      emit(state.copyWith(
          isLoading: false, product: product, isUpdateCartItem: false));
    } catch (e) {
      log('Error when get api home: $e');
      emit(state.copyWith(isLoading: false));
    }
  }

  void _selectAttributeValue(
      EventProductSelectAttributeValue event, Emitter emit) {
    try {
      List<CustomAttributeValue> attributeValues =
          state.selectedAttributeValues;
      if (attributeValues.isEmpty) {
        emit(state.copyWith(
            selectedAttributeValues: [event.customAttributeValue],
            quantity: 1));
      } else {
        int indexFind = attributeValues.indexWhere((element) =>
            element.customAttribute!.id ==
            event.customAttributeValue.customAttribute!.id);
        if (indexFind == -1) {
          emit(state.copyWith(selectedAttributeValues: [
            ...state.selectedAttributeValues,
            event.customAttributeValue
          ], quantity: 1));
        } else {
          if (attributeValues[indexFind].id != event.customAttributeValue.id) {
            attributeValues.add(event.customAttributeValue);
          }
          attributeValues.removeAt(indexFind);
          emit(state.copyWith(
              selectedAttributeValues: attributeValues, quantity: 1));
        }
      }
    } catch (e) {
      log('Error when select attribute value: $e');
    }
  }

  void _selectAttributeValues(
      EventProductSelectAttributeValues event, Emitter emit) {
    try {
      emit(
          state.copyWith(selectedAttributeValues: event.customAttributeValues));
    } catch (e) {
      log('Error when select attribute values: $e');
    }
  }

  void _resetProductSelected(EventResetProductSelected event, Emitter emit) {
    emit(state.copyWith(
        selectedAttributeValues: [],
        quantity: 1,
        productDetailId: '',
        isUpdateCartItem: false,
        product: ProductModel(shop: ShopModel())));
  }
}
