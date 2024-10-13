import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_buy/blocs/home_bloc/home_event.dart';
import 'package:share_buy/blocs/home_bloc/home_state.dart';
import 'package:share_buy/models/product/product_recommend_model.dart';
import 'package:share_buy/repositories/product_repository.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<EventLoading>(_loading);
  }

  Future<void> _loading(HomeEvent event, Emitter emit) async {
    try {
      emit(state.copyWith(isLoading: true));
      List<ProductRecommendModel> products = await ProductRepository()
          .getProductRecommend(userId: "66e9534da46697001266a095");

      emit(state.copyWith(
        isLoading: false,
        products: products,
      ));
    } catch (e) {
      log('Error when get api home: $e');
      emit(state.copyWith(isLoading: false));
    }
  }
}
