import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:share_buy/helper/network/http_client.dart';
import 'package:share_buy/models/attribute/attribute_custom_model.dart';
import 'package:share_buy/models/attribute/attribute_custom_value_model.dart';
import 'package:share_buy/models/product/product_detail_model.dart';
import 'package:share_buy/models/product/product_model.dart';
import 'package:share_buy/models/product/product_recommend_model.dart';
import 'package:share_buy/models/shop/shop_model.dart';

class ProductRepository extends FetchClient {
  Future<List<ProductRecommendModel>> getProductRecommend(
      {required String userId, int? page, int? pageSize}) async {
    try {
      final Response<dynamic> response = await super.getData(
        path: "/api/recommends/recommends/$userId",
        queryParameters: {
          'offset': (page ?? 1) - 1,
          'limit': pageSize ?? 10,
        },
      );
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        List<ProductRecommendModel> products = [];
        data.forEach((element) {
          products.add(ProductRecommendModel.fromJson(element));
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

  Future<ProductModel> getById({required String productId}) async {
    try {
      final Response<dynamic> response =
          await super.getData(path: "/api/products/products/$productId");
      List<ProductDetailModel> productDetails =
          await getProductDetailsByProductId(productId: productId);
      if (response.statusCode == 200) {
        ProductModel product = ProductModel.fromJson(response.data);
        List<CustomAttribute> attribute = _extractArrays(
            productDetails.map((e) => e.customAttributeValues!).toList());
        product.customAttributes = attribute;
        product.productDetails = productDetails;
        return product;
      } else {
        return ProductModel(shop: ShopModel());
      }
    } catch (e) {
      log('Error when get api product by id: $e');
      return ProductModel(shop: ShopModel());
    }
  }

  Future<List<ProductDetailModel>> getProductDetailsByProductId(
      {required String productId}) async {
    try {
      final Response<dynamic> response = await super
          .getData(path: '/api/products/product-details/products/$productId');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        List<ProductDetailModel> productDetails = [];
        data.forEach((element) {
          productDetails.add(ProductDetailModel.fromJson(element));
        });
        return productDetails;
      } else {
        return [];
      }
    } catch (e) {
      log('Error when get api product details by product id: $e');
      return [];
    }
  }

  Future<List<ProductRecommendModel>> getRecommendProduct(
      {required String productId, num? offset, num? limit}) async {
    try {
      final Response<dynamic> response = await super.getData(
          path: '/api/recommends/related-by-image/$productId',
          queryParameters: {
            'offset': offset ?? 0,
            'limit': limit ?? 10,
          });
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        List<ProductRecommendModel> products = [];
        data.forEach((element) {
          products.add(ProductRecommendModel.fromJson(element));
        });
        return products;
      } else {
        return [];
      }
    } catch (e) {
      log('Error when get api recommend product: $e');
      return [];
    }
  }
}

List<CustomAttribute> _extractArrays(
    List<List<CustomAttributeValue>> combinations) {
  try {
    if (combinations.isEmpty) return [];

    int length = combinations[0].length;
    List<CustomAttribute> arrays =
        List.generate(length, (index) => CustomAttribute());
    List<CustomAttributeValue> firstElement = combinations[0];
    List<List<CustomAttributeValue>> remainingElements =
        combinations.sublist(1);

    for (int i = 0; i < length; i++) {
      CustomAttributeValue customAttributeValue = firstElement[i];
      arrays[i] = CustomAttribute.fromJson({
        '_id': customAttributeValue.customAttribute!.id,
        'attribute_name': customAttributeValue.customAttribute!.attributeName,
        'custom_attribute_values': [
          {
            '_id': customAttributeValue.id,
            'value': customAttributeValue.value,
          }
        ]
      });
    }

    for (var combination in remainingElements) {
      for (int i = 0; i < length; i++) {
        CustomAttributeValue customAttributeValue = combination[i];

        int index = arrays.indexWhere((element) =>
            element.id == customAttributeValue.customAttribute!.id);
        int indexValue = arrays[index]
            .customAttributeValues!
            .indexWhere((element) => element.id == customAttributeValue.id);
        if (indexValue == -1) {
          arrays[index]
              .customAttributeValues!
              .add(CustomAttributeValue.fromJson({
                '_id': customAttributeValue.id,
                'value': customAttributeValue.value,
              }));
        }
      }
    }

    return arrays;
  } catch (e) {
    log('Error when extract arrays: $e');
    return [];
  }
}
