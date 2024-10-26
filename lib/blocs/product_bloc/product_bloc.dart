import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_buy/blocs/product_bloc/product_event.dart';
import 'package:share_buy/blocs/product_bloc/product_state.dart';
import 'package:share_buy/models/attribute/attribute_custom_value_model.dart';
import 'package:share_buy/models/product/product_model.dart';
import 'package:share_buy/models/shop/shop_model.dart';
import 'package:share_buy/repositories/cart_repository.dart';
import 'package:share_buy/repositories/product_repository.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  // ProductBloc(super.initialState);
  ProductBloc()
      : super(ProductState(product: ProductModel(shop: ShopModel()))) {
    on<ProductLoadingEvent>(_loading);
    on<ResetProductEvent>(_reset);
    on<SelectAttributeValueEvent>(_selectAttributeValue);
    on<ChangeQuantityEvent>(_changeQuantity);
    on<AddCartItemEvent>(_addProductToCart);
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
    if (event.isAddCart) {
      emit(state.copyWith(
        quantity: 1,
        isAddSuccess: false,
        selectedAttributeValues: [],
      ));
    } else {
      emit(ProductState(
          product: ProductModel(shop: ShopModel()),
          quantity: 1,
          selectedAttributeValues: [],
          isLoading: false,
          isAddSuccess: false));
    }
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

  Future<void> _addProductToCart(AddCartItemEvent event, Emitter emit) async {
    try {
      emit(state.copyWith(
        isLoading: true,
        isAddSuccess: false,
      ));
      final bool isSuccues = await CartRepository().addToCart(
          productDetailId: event.productDetailId, quantity: event.quantity);
      emit(state.copyWith(isLoading: false, isAddSuccess: isSuccues));
    } catch (e) {
      emit(state.copyWith(isLoading: false, isAddSuccess: false));
      log("Error when add product to cart: $e");
    }
  }
}
