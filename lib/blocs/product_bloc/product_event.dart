import 'package:share_buy/models/attribute/attribute_custom_value_model.dart';

abstract class ProductEvent {}

class ProductLoadingEvent extends ProductEvent {
  final String id;
  ProductLoadingEvent({required this.id});
}

class ResetProductEvent extends ProductEvent {}

class SelectAttributeValueEvent extends ProductEvent {
  final CustomAttributeValue customAttributeValue;
  SelectAttributeValueEvent({required this.customAttributeValue});
}

class ChangeQuantityEvent extends ProductEvent {
  final int quantity;
  ChangeQuantityEvent({required this.quantity});
}
