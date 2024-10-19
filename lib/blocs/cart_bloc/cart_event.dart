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

// class AddCartItemEvent extends CartEvent {
//   final String productDetailId;
//   final int quantity;

//   AddCartItemEvent({required this.productDetailId, required this.quantity});
// }
