import 'package:share_buy/models/attribute/attribute_custom_value_model.dart';
import 'package:share_buy/models/product/product_model.dart';
import 'package:share_buy/models/product/product_recommend_model.dart';
import 'package:share_buy/models/review/review_model.dart';

class ProductState {
  bool isLoading;
  ProductModel product;
  List<ReviewModel> reviews;
  List<ProductRecommendModel> productRecommends;

  String productDetailId;
  int quantity;
  bool isAddSuccess;
  List<CustomAttributeValue> selectedAttributeValues;

  ProductState(
      {this.isLoading = false,
      required this.product,
      this.reviews = const [],
      this.productRecommends = const [],
      this.selectedAttributeValues = const [],
      this.productDetailId = '',
      this.isAddSuccess = false,
      this.quantity = 1});

  ProductState copyWith(
      {bool? isLoading,
      ProductModel? product,
      List<ReviewModel>? reviews,
      List<ProductRecommendModel>? productRecommends,
      List<CustomAttributeValue>? selectedAttributeValues,
      String? productDetailId,
      bool? isAddSuccess,
      int? quantity}) {
    return ProductState(
        isLoading: isLoading ?? this.isLoading,
        product: product ?? this.product,
        reviews: reviews ?? this.reviews,
        productRecommends: productRecommends ?? this.productRecommends,
        selectedAttributeValues:
            selectedAttributeValues ?? this.selectedAttributeValues,
        productDetailId: productDetailId ?? this.productDetailId,
        isAddSuccess: isAddSuccess ?? this.isAddSuccess,
        quantity: quantity ?? this.quantity);
  }
}
