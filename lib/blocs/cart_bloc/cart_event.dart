import 'package:share_buy/models/cart/cart_item_model.dart';

class CartEvent {}

class CartLoadingEvent extends CartEvent {}

class ChangeAttributeCartItemEvent extends CartEvent {
  final String productDetailId;
  ChangeAttributeCartItemEvent({required this.productDetailId});
}

class EventSelectItemCartCheckbox extends CartEvent {
  final String itemCartId;
  final bool value;
  EventSelectItemCartCheckbox({required this.itemCartId, required this.value});
}

class UpdateQuantityCartItemEvent extends CartEvent {
  final String cartItemId;
  final int quantity;

  UpdateQuantityCartItemEvent(
      {required this.cartItemId, required this.quantity});
}
