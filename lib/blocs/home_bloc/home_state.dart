import 'package:share_buy/models/product/product_model.dart';

class HomeState {
  bool isLoading;
  List<ProductModel> products;

  HomeState({this.isLoading = false, this.products = const []});

  HomeState copyWith({bool? isLoading, List<ProductModel>? products}) {
    return HomeState(
        isLoading: isLoading ?? this.isLoading,
        products: products ?? this.products);
  }
}
