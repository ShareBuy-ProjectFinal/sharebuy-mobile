import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:share_buy/helper/constant/app_constant.dart';
import 'package:share_buy/helper/network/http_client.dart';

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
}
