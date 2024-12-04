import 'dart:developer';

import 'package:share_buy/blocs/auth_bloc/auth_bloc.dart';
import 'package:share_buy/helper/network/http_client.dart';
import 'package:share_buy/models/review/review_model.dart';

class ReviewRepository extends FetchClient {
  Future<bool> addReviewProduct(ReviewModel review) async {
    try {
      final rep = await super.postData(path: '/api/reviews', params: {
        "product_id": review.productId,
        "user_id": AuthBloc.currentUser?.id,
        "rating": review.rating,
        "review_content": review.reviewContent,
        "images": review.images ?? []
      });

      if (rep.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log('Error when add review product: $e');
      return false;
    }
  }

  Future<List<ReviewModel>> getReviewProduct(
      {required String productId,
      num? page,
      num? pageSize,
      num? rating}) async {
    try {
      final rep = await super
          .getData(path: '/api/reviews/products/$productId', queryParameters: {
        "rating": rating,
        "page": (page?.toInt() ?? 1) - 1,
        "limit": pageSize,
      });

      if (rep.statusCode == 200) {
        final List<dynamic> data = rep.data;
        return data.map((e) => ReviewModel.fromJson(e)).toList();
      } else {
        return [];
      }
    } catch (e) {
      log('Error when get review product: $e');
      return [];
    }
  }
}
