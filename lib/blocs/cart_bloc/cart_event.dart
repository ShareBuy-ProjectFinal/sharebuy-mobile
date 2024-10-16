class CartEvent {}

class AddCartItemEvent extends CartEvent {
  final String productDetailId;
  final int quantity;

  AddCartItemEvent({required this.productDetailId, required this.quantity});
}
