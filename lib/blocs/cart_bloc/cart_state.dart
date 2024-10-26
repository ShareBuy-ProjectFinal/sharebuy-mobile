import 'package:share_buy/enums/PayType.dart';
import 'package:share_buy/models/cart/cart_item_model.dart';
import 'package:share_buy/models/cart/cart_model.dart';

class CartState {
  bool isLoading;
  bool isSuccues;
  String productDetailId;
  PayType payType;
  String? payUrl;

  List<CartModel> carts;
  List<CartItemModel> selectedCartItems;

  CartState({
    this.isLoading = false,
    this.isSuccues = false,
    this.carts = const [],
    this.productDetailId = '',
    this.selectedCartItems = const [],
    this.payType = PayType.momo,
    this.payUrl = '',
  });

  CartState copyWith({
    bool? isLoading,
    bool? isSuccues,
    List<CartModel>? carts,
    List<CartItemModel>? selectedCartItems,
    String? productDetailId,
    PayType? payType,
    String? payUrl,
  }) {
    return CartState(
      isLoading: isLoading ?? this.isLoading,
      isSuccues: isSuccues ?? this.isSuccues,
      carts: carts ?? this.carts,
      productDetailId: productDetailId ?? this.productDetailId,
      selectedCartItems: selectedCartItems ?? this.selectedCartItems,
      payType: payType ?? this.payType,
      payUrl: payUrl ?? this.payUrl,
    );
  }
}
