import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:share_buy/helper/constant/app_constant.dart';
import 'package:share_buy/helper/network/http_client.dart';
import 'package:share_buy/models/cart/cart_model.dart';

class CartRepository extends FetchClient {
  Future<bool> addToCart(
      {required String productDetailId, required int quantity}) async {
    try {
      final Response<dynamic> response =
          await super.postData(path: '/api/carts', params: {
        'user_id': AppConstants.getMe.id,
        'product_detail_id': productDetailId,
        'quantity': quantity
      });
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log('Error when add to cart: $e');
      return false;
    }
  }

  Future<List<CartModel>> getByUserId() async {
    try {
      final Response<dynamic> response = await super
          .getData(path: '/api/carts/users/${AppConstants.getMe.id}');
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
}
