import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/routes/navigator_name.dart';
import 'package:share_buy/application/theme/app_typography.dart';
import 'package:share_buy/blocs/product_bloc/product_bloc.dart';
import 'package:share_buy/blocs/product_bloc/product_state.dart';
import 'package:share_buy/blocs/review_bloc/review_bloc.dart';
import 'package:share_buy/blocs/review_bloc/review_event.dart';
import 'package:share_buy/models/product/product_recommend_model.dart';

class RateComment extends StatefulWidget {
  final ProductRecommendModel product;
  const RateComment({super.key, required this.product});

  @override
  State<RateComment> createState() => _RateCommentState();
}

class _RateCommentState extends State<RateComment> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
      return state.reviews.isEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Đánh giá',
                      style: AppTypography.primaryDarkBlueBold,
                    ),
                    GestureDetector(
                      onTap: () {
                        context
                            .read<ReviewBloc>()
                            .add(EventResetReview(state.product.id ?? ''));
                        Navigator.of(context)
                            .pushNamed(NavigatorName.RATE_COMMENT_FORM_SCREEN);
                      },
                      child: Text(
                        'Viết đánh giá',
                        style: AppTypography.mediumBlueBold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 6.h,
                ),
                Text(
                  'Chưa có đánh giá nào',
                  style: AppTypography.hintTextStyle,
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Đánh giá',
                      style: AppTypography.primaryDarkBlueBold,
                    ),
                    GestureDetector(
                      onTap: () {
                        context
                            .read<ReviewBloc>()
                            .add(EventResetReview(state.product.id ?? ''));

                        Navigator.of(context).pushNamed(
                          NavigatorName.RATE_SCREEN,
                        );
                      },
                      child: Text(
                        'Xem thêm',
                        style: AppTypography.mediumBlueBold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 6.h,
                ),
                Row(
                  children: [
                    AnimatedRatingStars(
                      initialRating:
                          state.product.averageRating?.toDouble() ?? 0,
                      filledColor: Colors.amber,
                      emptyColor: Colors.grey,
                      filledIcon: Icons.star,
                      halfFilledIcon: Icons.star_half,
                      emptyIcon: Icons.star_border,
                      onChanged: (double rating) {},
                      displayRatingValue: true,
                      interactiveTooltips: true,
                      customFilledIcon: Icons.star,
                      customHalfFilledIcon: Icons.star_half,
                      customEmptyIcon: Icons.star_border,
                      starSize: 12.sp,
                      readOnly: true,
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    Text(
                      (state.product.averageRating ?? 0).toStringAsFixed(2),
                      style: AppTypography.hintTextStyleBold,
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    Text(
                      '(${state.reviews.length} Review)',
                      style: AppTypography.hintTextStyle,
                    )
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 30.r,
                      backgroundImage:
                          const AssetImage('assets/images/avatar.png'),
                    ),
                    SizedBox(
                      width: 12.0.w,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.reviews[0].user?.fullName ?? '',
                          style: AppTypography.primaryDarkBlueBold,
                        ),
                        AnimatedRatingStars(
                          initialRating:
                              state.reviews[0].rating?.toDouble() ?? 0,
                          filledColor: Colors.amber,
                          emptyColor: Colors.grey,
                          filledIcon: Icons.star,
                          halfFilledIcon: Icons.star_half,
                          emptyIcon: Icons.star_border,
                          onChanged: (double rating) {},
                          displayRatingValue: true,
                          interactiveTooltips: true,
                          customFilledIcon: Icons.star,
                          customHalfFilledIcon: Icons.star_half,
                          customEmptyIcon: Icons.star_border,
                          starSize: 12.sp,
                          readOnly: true,
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 6.h,
                ),
                Text(
                  state.reviews[0].reviewContent ?? '',
                  style: AppTypography.hintTextStyle,
                ),
                SizedBox(
                  height: 12.h,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: (state.reviews[0].images ?? [])
                        .asMap()
                        .entries
                        .map((element) {
                      return Container(
                        margin: EdgeInsets.only(right: 10.w),
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: const Color.fromARGB(128, 158, 158, 158),
                            ),
                            borderRadius: BorderRadius.circular(2.r)),
                        child: CachedNetworkImage(
                          imageUrl: element.value,
                          width: 72.w,
                          height: 72.h,
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  'December 10, 2016',
                  style: AppTypography.hintTextStyle,
                ),
              ],
            );
    });
  }
}
