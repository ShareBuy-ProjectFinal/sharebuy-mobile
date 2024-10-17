import 'package:share_buy/models/cart/cart_model.dart';

class CartState {
  bool isLoading;
  String productDetailId;

  List<CartModel> carts;

  CartState({
    this.isLoading = false,
    this.carts = const [],
    this.productDetailId = '',
  });

  CartState copyWith({
    bool? isLoading,
    List<CartModel>? carts,
    String? productDetailId,
  }) {
    return CartState(
      isLoading: isLoading ?? this.isLoading,
      carts: carts ?? this.carts,
      productDetailId: productDetailId ?? this.productDetailId,
    );
  }
}
