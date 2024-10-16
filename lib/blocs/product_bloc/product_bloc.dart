import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_buy/blocs/product_bloc/product_event.dart';
import 'package:share_buy/blocs/product_bloc/product_state.dart';
import 'package:share_buy/models/attribute/attribute_custom_value_model.dart';
import 'package:share_buy/models/product/product_model.dart';
import 'package:share_buy/repositories/product_repository.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  // ProductBloc(super.initialState);
  ProductBloc() : super(ProductState(product: ProductModel())) {
    on<ProductLoadingEvent>(_loading);
    on<ResetProductEvent>(_reset);
    on<SelectAttributeValueEvent>(_selectAttributeValue);
    on<ChangeQuantityEvent>(_changeQuantity);
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

  void _reset(ResetProductEvent event, Emitter emit) {
    emit(ProductState(product: ProductModel()));
  }

  void _selectAttributeValue(SelectAttributeValueEvent event, Emitter emit) {
    try {
      List<CustomAttributeValue> attributeValues =
          state.selectedAttributeValues;
      if (attributeValues.isEmpty) {
        emit(state.copyWith(
            selectedAttributeValues: [event.customAttributeValue],
            quantity: 1));
      } else {
        int indexFind = attributeValues.indexWhere((element) =>
            element.customAttribute!.id ==
            event.customAttributeValue.customAttribute!.id);
        if (indexFind == -1) {
          emit(state.copyWith(selectedAttributeValues: [
            ...state.selectedAttributeValues,
            event.customAttributeValue
          ], quantity: 1));
        } else {
          if (attributeValues[indexFind].id != event.customAttributeValue.id) {
            attributeValues.add(event.customAttributeValue);
          }
          attributeValues.removeAt(indexFind);
          emit(state.copyWith(
              selectedAttributeValues: attributeValues, quantity: 1));
        }
      }
    } catch (e) {
      log('Error when select attribute value: $e');
    }
  }

  void _changeQuantity(ChangeQuantityEvent event, Emitter emit) {
    log("Change quantity: ${event.quantity}");
    emit(state.copyWith(quantity: event.quantity));
  }
}
