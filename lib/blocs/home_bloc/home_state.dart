import 'package:share_buy/models/product/product_recommend_model.dart';

class HomeState {
  bool isLoading;
  List<ProductRecommendModel> productRecommendsFlashSale;
  List<ProductRecommendModel> productRecommendsUser;

  HomeState(
      {this.isLoading = false,
      this.productRecommendsFlashSale = const [],
      this.productRecommendsUser = const []});

  HomeState copyWith(
      {bool? isLoading,
      List<ProductRecommendModel>? productRecommendsFlashSale,
      List<ProductRecommendModel>? productRecommendsUser}) {
    return HomeState(
        isLoading: isLoading ?? this.isLoading,
        productRecommendsUser:
            productRecommendsUser ?? this.productRecommendsUser,
        productRecommendsFlashSale:
            productRecommendsFlashSale ?? this.productRecommendsFlashSale);
  }
}
