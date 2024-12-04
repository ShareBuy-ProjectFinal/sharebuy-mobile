import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/theme/app_typography.dart';
import 'package:share_buy/models/comment.dart';
import 'package:share_buy/models/review/review_model.dart';

class RateComment extends StatefulWidget {
  final Comment comment;
  final ReviewModel review;
  const RateComment({super.key, required this.comment, required this.review});

  @override
  State<RateComment> createState() => _RateCommentState();
}

class _RateCommentState extends State<RateComment> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30.r,
              backgroundImage: AssetImage(
                  widget.review.user?.image ?? "assets/images/avatar.png"),
            ),
            SizedBox(
              width: 12.0.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  " ${widget.review.user!.fullName}",
                  style: AppTypography.primaryDarkBlueBold,
                ),
                AnimatedRatingStars(
                  initialRating: widget.review.rating!.toDouble(),
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
                  starSize: 10.sp,
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
          widget.review.reviewContent ?? "",
          style: AppTypography.hintTextStyle,
        ),
        SizedBox(
          height: 12.h,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children:
                (widget.review.images ?? []).asMap().entries.map((element) {
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
        // SizedBox(
        //   height: 12.h,
        // ),
      ],
    );
  }
}
