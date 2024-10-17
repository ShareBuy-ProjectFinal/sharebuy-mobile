class CartEvent {}

class CartLoadingEvent extends CartEvent {}

class ChangeAttributeCartItemEvent extends CartEvent {
  final String productDetailId;
  ChangeAttributeCartItemEvent({required this.productDetailId});
}

// class AddCartItemEvent extends CartEvent {
//   final String productDetailId;
//   final int quantity;

//   AddCartItemEvent({required this.productDetailId, required this.quantity});
// }
