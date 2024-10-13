import 'package:share_buy/models/product/product_recommend_model.dart';

class HomeState {
  bool isLoading;
  List<ProductRecommendModel> products;

  HomeState({this.isLoading = false, this.products = const []});

  HomeState copyWith({bool? isLoading, List<ProductRecommendModel>? products}) {
    return HomeState(
        isLoading: isLoading ?? this.isLoading,
        products: products ?? this.products);
  }
}
