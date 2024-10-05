import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:share_buy/helper/network/http_client.dart';
import 'package:share_buy/models/product/product_model.dart';

class ProductRepository extends FetchClient {
  Future<List<ProductModel>> getProductRecommend(
      {required String userId}) async {
    try {
      final Response<dynamic> response = await super.getData(
        domainApp: 'http://103.209.32.148:8000',
        path: "/api/recommends/recommends/$userId",
      );
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        List<ProductModel> products = [];
        data.forEach((element) {
          products.add(ProductModel.fromJson(element));
        });
        return products;
      } else {
        return [];
      }
    } catch (e) {
      log('Error when get api product recommend: $e');
      return [];
    }
  }
}
