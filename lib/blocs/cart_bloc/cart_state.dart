import 'package:share_buy/models/cart/cart_item_model.dart';
import 'package:share_buy/models/cart/cart_model.dart';

class CartState {
  bool isLoading;
  String productDetailId;

  List<CartModel> carts;
  List<CartItemModel> selectedCartItems;

  CartState({
    this.isLoading = false,
    this.carts = const [],
    this.productDetailId = '',
    this.selectedCartItems = const [],
  });

  CartState copyWith({
    bool? isLoading,
    List<CartModel>? carts,
    List<CartItemModel>? selectedCartItems,
    String? productDetailId,
  }) {
    return CartState(
      isLoading: isLoading ?? this.isLoading,
      carts: carts ?? this.carts,
      productDetailId: productDetailId ?? this.productDetailId,
      selectedCartItems: selectedCartItems ?? this.selectedCartItems,
    );
  }
}
