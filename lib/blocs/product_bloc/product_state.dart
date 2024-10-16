import 'package:share_buy/models/attribute/attribute_custom_value_model.dart';
import 'package:share_buy/models/product/product_model.dart';

class ProductState {
  bool isLoading;
  ProductModel product;
  int quantity;
  List<CustomAttributeValue> selectedAttributeValues;

  ProductState(
      {this.isLoading = false,
      required this.product,
      this.selectedAttributeValues = const [],
      this.quantity = 1});

  ProductState copyWith(
      {bool? isLoading,
      ProductModel? product,
      List<CustomAttributeValue>? selectedAttributeValues,
      int? quantity}) {
    return ProductState(
        isLoading: isLoading ?? this.isLoading,
        product: product ?? this.product,
        selectedAttributeValues:
            selectedAttributeValues ?? this.selectedAttributeValues,
        quantity: quantity ?? this.quantity);
  }
}
