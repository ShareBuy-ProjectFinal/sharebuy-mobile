import 'package:share_buy/models/attribute/attribute_custom_value_model.dart';

abstract class ProductEvent {}

class ProductLoadingEvent extends ProductEvent {
  final String id;
  ProductLoadingEvent({required this.id});
}

class ResetProductEvent extends ProductEvent {
  final bool isAddCart;
  ResetProductEvent({this.isAddCart = false});
}

class SelectAttributeValueEvent extends ProductEvent {
  final CustomAttributeValue customAttributeValue;
  SelectAttributeValueEvent({required this.customAttributeValue});
}

class ChangeQuantityEvent extends ProductEvent {
  final int quantity;
  ChangeQuantityEvent({required this.quantity});
}

class AddCartItemEvent extends ProductEvent {
  final String productDetailId;
  final int quantity;

  AddCartItemEvent({required this.productDetailId, required this.quantity});
}
