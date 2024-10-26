import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:share_buy/blocs/auth_bloc/auth_bloc.dart';
import 'package:share_buy/helper/constant/app_constant.dart';
import 'package:share_buy/helper/network/http_client.dart';
import 'package:share_buy/models/cart/cart_model.dart';
import 'package:share_buy/models/order/order_model.dart';

class CartRepository extends FetchClient {
  Future<bool> addToCart(
      {required String productDetailId, required int quantity}) async {
    try {
      final Response<dynamic> response =
          await super.postData(path: '/api/carts', params: {
        'user_id': AuthBloc.currentUser?.id,
        'product_detail_id': productDetailId,
        'quantity': quantity
      });
      log('response addToCart: ${response.data}');
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log('Error when add to cart: $e');
      return false;
    }
  }

  Future<bool> updateToCartById(
      {required String cartItemId, required int quantity}) async {
    try {
      final Response<dynamic> response = await super.putData(
          path: '/api/carts/$cartItemId', params: {'quantity': quantity});
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log('Error when update to cart by id: $e');
      return false;
    }
  }

  Future<List<CartModel>> getByUserId() async {
    try {
      final Response<dynamic> response = await super
          .getData(path: '/api/carts/users/${AuthBloc.currentUser?.id}');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        List<CartModel> carts = [];
        data.forEach((element) {
          carts.add(CartModel.fromJson(element));
        });
        return carts;
      } else {
        return [];
      }
    } catch (e) {
      log('Error when get api cart by user id: $e');
      return [];
    }
  }

  Future<dynamic> purchaseCart(
      {required List<CartModel> carts, required String payType}) async {
    try {
      final Response<dynamic> response =
          await super.postData(path: "/api/orders/", params: {
        'customer_id': AuthBloc.currentUser?.id,
        "payment_method": payType,
        // "address_id": " AuthBloc.currentUser" ,
        "address_id": "6719705c6c7e9300135e4b52",
        "cart_items": carts.getCartItemIdSelected()
      });
      if (response.statusCode == 201) {
        // log("response purchaseCart: ${response.data}");
        return OrderModel.fromJson(response.data);
      } else {
        return false;
      }
    } catch (e) {
      log('Error when purchase cart: $e');
      return false;
    }
  }
}
