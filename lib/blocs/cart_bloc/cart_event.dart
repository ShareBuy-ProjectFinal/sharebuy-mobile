import 'package:share_buy/models/cart/cart_item_model.dart';
import 'package:share_buy/models/cart/cart_model.dart';

class CartEvent {}

class CartLoadingEvent extends CartEvent {}

class ChangeAttributeCartItemEvent extends CartEvent {
  final String productDetailId;
  ChangeAttributeCartItemEvent({required this.productDetailId});
}

class EventSelectItemCartCheckbox extends CartEvent {
  final String itemId;
  final bool value;
  final bool isShop;
  EventSelectItemCartCheckbox(
      {required this.itemId, required this.value, this.isShop = false});
}

class UpdateQuantityCartItemEvent extends CartEvent {
  final String cartItemId;
  final int quantity;

  UpdateQuantityCartItemEvent(
      {required this.cartItemId, required this.quantity});
}

class EventPurchaseCart extends CartEvent {
  final List<CartModel> carts;
  EventPurchaseCart({required this.carts});
}
