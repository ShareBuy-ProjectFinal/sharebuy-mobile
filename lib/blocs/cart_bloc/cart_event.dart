class CartEvent {}

class CartLoadingEvent extends CartEvent {}

class ChangeAttributeCartItemEvent extends CartEvent {
  final String productDetailId;
  ChangeAttributeCartItemEvent({required this.productDetailId});
}

class UpdateQuantityCartItemEvent extends CartEvent {
  final String cartItemId;
  final int quantity;

  UpdateQuantityCartItemEvent(
      {required this.cartItemId, required this.quantity});
}
