import 'package:share_buy/models/review/review_model.dart';

class ReviewEvent {}

class EventLoadingReview extends ReviewEvent {}

class EventResetReview extends ReviewEvent {
  final String productId;
  EventResetReview(this.productId);
}

class EventSelectRating extends ReviewEvent {
  final num rating;

  EventSelectRating(this.rating);
}

class EvendAddReview extends ReviewEvent {
  final String contentReview;

  EvendAddReview(this.contentReview);
}
