import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_buy/blocs/cart_bloc/cart_event.dart';
import 'package:share_buy/blocs/cart_bloc/cart_state.dart';
import 'package:share_buy/repositories/cart_repository.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState()) {
    on<AddCartItemEvent>(_addProductToCart);
  }

  Future<bool> _addProductToCart(AddCartItemEvent event, Emitter emit) async {
    try {
      emit(state.copyWith(isLoading: true));
      final bool isSuccues = await CartRepository().addToCart(
          productDetailId: event.productDetailId, quantity: event.quantity);
      emit(state.copyWith(isLoading: false));
      return isSuccues;
    } catch (e) {
      emit(state.copyWith(isLoading: false));
      return false;
    }
  }
}
