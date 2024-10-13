import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_buy/blocs/product_bloc/product_event.dart';
import 'package:share_buy/blocs/product_bloc/product_state.dart';
import 'package:share_buy/models/product/product_model.dart';
import 'package:share_buy/repositories/product_repository.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  // ProductBloc(super.initialState);
  ProductBloc() : super(ProductState(product: ProductModel())) {
    on<ProductLoadingEvent>(_loading);
  }

  Future<void> _loading(ProductLoadingEvent event, Emitter emit) async {
    try {
      emit(state.copyWith(isLoading: true));
      ProductModel product =
          await ProductRepository().getById(productId: event.id);

      emit(state.copyWith(isLoading: false, product: product));
    } catch (e) {
      log('Error when get api home: $e');
      emit(state.copyWith(isLoading: false));
    }
  }
}
