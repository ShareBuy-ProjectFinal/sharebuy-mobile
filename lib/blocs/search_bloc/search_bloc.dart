import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_buy/blocs/search_bloc/search_event.dart';
import 'package:share_buy/blocs/search_bloc/search_state.dart';
import 'package:share_buy/models/product/product_recommend_model.dart';
import 'package:share_buy/repositories/product_repository.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchState()) {
    on<EventSearchProduct>(_searchProduct);
    on<EventLoadData>(_loadData);
  }

  Future<void> _searchProduct(EventSearchProduct event, Emitter emit) async {
    try {
      emit(state.copyWith(isLoading: true, isLoadingOrverLay: true));
      List<ProductRecommendModel> products =
          await ProductRepository().searchProduct(keyword: event.keyword);

      emit(state.copyWith(
          isLoading: false,
          isLoadingOrverLay: false,
          productRecommends: products,
          offset: 0,
          keyword: event.keyword));
    } catch (e) {
      log(' Error when search product: ${e.toString()}');
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _loadData(EventLoadData event, Emitter emit) async {
    try {
      emit(state.copyWith(isLoading: true));
      List<ProductRecommendModel> products = await ProductRepository()
          .searchProduct(keyword: event.keyword, offset: state.offset + 1);
      emit(state.copyWith(
          isLoading: false,
          offset: state.offset + 1,
          productRecommends: state.productRecommends + products));
    } catch (e) {
      log(' Error when load data: ${e.toString()}');
      emit(state.copyWith(isLoading: false));
    }
  }
}
