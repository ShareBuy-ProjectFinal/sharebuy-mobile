import 'package:share_buy/models/product/product_model.dart';

class ProductState {
  bool isLoading;
  ProductModel product;

  ProductState({this.isLoading = false, required this.product});

  ProductState copyWith({bool? isLoading, ProductModel? product}) {
    return ProductState(
      isLoading: isLoading ?? this.isLoading,
      product: product ?? this.product,
    );
  }
}
