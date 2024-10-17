import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_buy/blocs/cart_bloc/cart_event.dart';
import 'package:share_buy/blocs/cart_bloc/cart_state.dart';
import 'package:share_buy/models/cart/cart_model.dart';
import 'package:share_buy/repositories/cart_repository.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState()) {
    on<UpdateQuantityCartItemEvent>(_updateQuantityProductToCart);
    on<CartLoadingEvent>(_loading);
    on<ChangeAttributeCartItemEvent>(_changeAttributeCartItem);
  }

  Future<void> _updateQuantityProductToCart(
      UpdateQuantityCartItemEvent event, Emitter emit) async {
    try {
      emit(state.copyWith(isLoading: true));
      final bool isSuccues = await CartRepository().updateToCartById(
          cartItemId: event.cartItemId, quantity: event.quantity);
      if (isSuccues) {
        int indexFind = state.carts.indexWhere((e) =>
            e.cartItems
                ?.indexWhere((element) => element.id == event.cartItemId) !=
            -1);
        if (indexFind != -1) {
          int indexItem = state.carts[indexFind].cartItems!
              .indexWhere((element) => element.id == event.cartItemId);
          state.carts[indexFind].cartItems![indexItem].quantity =
              event.quantity;
        }
      }
      emit(state.copyWith(isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false));
      log("Error when update quantity product to cart: $e");
    }
  }

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
}
