import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_buy/blocs/review_bloc/review_event.dart';
import 'package:share_buy/blocs/review_bloc/review_state.dart';
import 'package:share_buy/models/review/review_model.dart';
import 'package:share_buy/repositories/review_repository.dart';
import 'package:share_buy/repositories/upload_repository.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  ReviewBloc() : super(ReviewState()) {
    on<EventResetReview>(_reset);
    on<EventSelectRating>(_selectRating);
    on<EvendAddReview>(_addReview);
  }

  void _reset(EventResetReview event, Emitter emit) {
    emit(state.copyWith(
        review: ReviewModel(productId: event.productId, rating: 0),
        isAddSuccess: false));
  }

  void _selectRating(EventSelectRating event, Emitter emit) {
    ReviewModel review = state.review?.copyWith(rating: event.rating) ??
        ReviewModel(rating: event.rating);
    // log('_selectRating rating: ${event.rating}');
    // log('_selectRating review: ${review.rating}');
    emit(state.copyWith(review: review));
  }

  Future<void> _addReview(EvendAddReview event, Emitter emit) async {
    try {
      emit(state.copyWith(isLoading: true));
      List<String> urls = await UploadRepository().uploadFile(event.images);
      ReviewModel review = state.review
              ?.copyWith(reviewContent: event.contentReview, images: urls) ??
          ReviewModel(reviewContent: event.contentReview);

      log('_addReview Add review: ${review.toJson()}');

      bool result = await ReviewRepository().addReviewProduct(review);
      emit(state.copyWith(
          isLoading: false, isAddSuccess: result, review: review));
    } catch (e) {
      log('Error when add review: $e');
      emit(state.copyWith(isLoading: false));
    }
  }
}
