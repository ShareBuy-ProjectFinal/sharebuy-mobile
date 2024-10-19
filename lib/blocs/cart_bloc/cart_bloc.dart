import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_buy/blocs/cart_bloc/cart_event.dart';
import 'package:share_buy/blocs/cart_bloc/cart_state.dart';
import 'package:share_buy/models/cart/cart_model.dart';
import 'package:share_buy/repositories/cart_repository.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState()) {
    // on<AddCartItemEvent>(_addProductToCart);
    on<CartLoadingEvent>(_loading);
    on<ChangeAttributeCartItemEvent>(_changeAttributeCartItem);
    on<EventSelectItemCartCheckbox>(_selectCartItem);
  }

  // Future<bool> _addProductToCart(AddCartItemEvent event, Emitter emit) async {
  //   try {
  //     emit(state.copyWith(isLoading: true));
  //     final bool isSuccues = await CartRepository().addToCart(
  //         productDetailId: event.productDetailId, quantity: event.quantity);
  //     emit(state.copyWith(isLoading: false));
  //     return isSuccues;
  //   } catch (e) {
  //     emit(state.copyWith(isLoading: false));
  //     return false;
  //   }
  // }

  Future<void> _loading(CartLoadingEvent event, Emitter emit) async {
    try {
      emit(state.copyWith(isLoading: true));
      List<CartModel> carts = await CartRepository().getByUserId();
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
      if (!event.value) {
        state.carts.forEach((cart) {
          cart.cartItems!.forEach((cartItem) {
            if (cartItem.id == event.itemCartId) {
              cartItem.isSelected = false;
            }
          });
        });
      } else {
        state.carts.forEach((cart) {
          cart.cartItems!.forEach((cartItem) {
            if (cartItem.id == event.itemCartId) {
              cartItem.isSelected = true;
            }
          });
        });
      }
      emit(state.copyWith(carts: state.carts));
    } catch (e) {
      log('Error when select cart item: $e');
    }
  }
}
