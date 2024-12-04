import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_buy/blocs/auth_bloc/auth_bloc.dart';
import 'package:share_buy/blocs/home_bloc/home_event.dart';
import 'package:share_buy/blocs/home_bloc/home_state.dart';
import 'package:share_buy/models/product/product_recommend_model.dart';
import 'package:share_buy/repositories/product_repository.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<EventLoadingRecommendFlashSale>(_loadingRecommendFlashSale);
    on<EventLoadingRecommendUser>(_loadingRecommendUser);
  }

  Future<void> _loadingRecommendFlashSale(
      EventLoadingRecommendFlashSale event, Emitter emit) async {
    try {
      emit(state.copyWith(isLoading: true));
      List<ProductRecommendModel> products = await ProductRepository()
          .getProductRecommend(
              userId: AuthBloc.currentUser?.id ?? '', page: 1, pageSize: 10);

      emit(state.copyWith(
        isLoading: false,
        productRecommendsFlashSale: products,
      ));
    } catch (e) {
      log('Error when get api home: $e');
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _loadingRecommendUser(
      EventLoadingRecommendUser event, Emitter emit) async {
    try {
      emit(state.copyWith(isLoading: true));
      List<ProductRecommendModel> products = await ProductRepository()
          .getProductRecommend(
              userId: AuthBloc.currentUser?.id ?? '', page: 2, pageSize: 10);

      emit(state.copyWith(
        isLoading: false,
        productRecommendsUser: products,
      ));
    } catch (e) {
      log('Error when get api home: $e');
      emit(state.copyWith(isLoading: false));
    }
  }
}
