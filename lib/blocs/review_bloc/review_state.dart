import 'package:share_buy/models/review/review_model.dart';

class ReviewState {
  bool isLoading;
  bool isAddSuccess;
  ReviewModel? review;

  ReviewState({this.isLoading = false, this.isAddSuccess = false, this.review});

  ReviewState copyWith(
      {bool? isLoading, bool? isAddSuccess, ReviewModel? review}) {
    return ReviewState(
        isLoading: isLoading ?? this.isLoading,
        isAddSuccess: isAddSuccess ?? this.isAddSuccess,
        review: review ?? this.review);
  }
}
