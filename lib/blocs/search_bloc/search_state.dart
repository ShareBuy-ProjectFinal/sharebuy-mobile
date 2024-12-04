import 'package:share_buy/models/product/product_recommend_model.dart';

class SearchState {
  bool isLoading;
  bool isLoadingOrverLay;
  int offset;
  String keyword;
  List<ProductRecommendModel> productRecommends;

  SearchState({
    this.isLoadingOrverLay = false,
    this.isLoading = false,
    this.productRecommends = const [],
    this.keyword = '',
    this.offset = 0,
  });

  SearchState copyWith({
    bool? isLoading,
    bool? isLoadingOrverLay,
    int? offset,
    String? keyword,
    List<ProductRecommendModel>? productRecommends,
  }) {
    return SearchState(
      isLoading: isLoading ?? this.isLoading,
      isLoadingOrverLay: isLoadingOrverLay ?? this.isLoadingOrverLay,
      offset: offset ?? this.offset,
      keyword: keyword ?? this.keyword,
      productRecommends: productRecommends ?? this.productRecommends,
    );
  }
}
