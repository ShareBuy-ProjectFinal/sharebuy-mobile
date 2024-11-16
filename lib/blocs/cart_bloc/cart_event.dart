import 'package:share_buy/models/attribute/attribute_custom_value_model.dart';
import 'package:share_buy/models/cart/cart_item_model.dart';
import 'package:share_buy/models/cart/cart_model.dart';

class CartEvent {}

class CartLoadingEvent extends CartEvent {}

class ChangeAttributeCartItemEvent extends CartEvent {
  final String productDetailId;
  ChangeAttributeCartItemEvent({required this.productDetailId});
}

enum TypeCheckBox { shop, item, all }

class EventSelectItemCartCheckbox extends CartEvent {
  final String? itemId;
  final bool value;
  TypeCheckBox type;
  EventSelectItemCartCheckbox(
      {this.itemId, required this.value, required this.type});
}

class UpdateQuantityCartItemEvent extends CartEvent {
  final String cartItemId;
  final int quantity;
  final bool? isBottomSheet;

  UpdateQuantityCartItemEvent(
      {required this.cartItemId,
      required this.quantity,
      this.isBottomSheet = false});
}

class EventPurchaseCart extends CartEvent {
  final List<CartModel> carts;
  EventPurchaseCart({required this.carts});
}

class EventReLoadScreen extends CartEvent {}

class EventChangeQuantityProductSelected extends CartEvent {
  final int quantity;
  EventChangeQuantityProductSelected({required this.quantity});
}

class EventLoadingProductSelected extends CartEvent {
  final String id;
  EventLoadingProductSelected({required this.id});
}

class EventProductSelectAttributeValue extends CartEvent {
  final CustomAttributeValue customAttributeValue;
  EventProductSelectAttributeValue({required this.customAttributeValue});
}

class EventProductSelectAttributeValues extends CartEvent {
  final List<CustomAttributeValue> customAttributeValues;
  EventProductSelectAttributeValues({required this.customAttributeValues});
}

class EventResetProductSelected extends CartEvent {}
