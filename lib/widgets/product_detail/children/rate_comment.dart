import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/routes/navigator_name.dart';
import 'package:share_buy/application/theme/app_typography.dart';
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
    List<String> urlImages = [
      widget.product.payload?.image ?? '',
      widget.product.payload?.image ?? '',
      widget.product.payload?.image ?? '',
    ];
    return Column(
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
              onTap: () => Navigator.of(context).pushNamed(
                NavigatorName.RATE_SCREEN,
              ),
              child: Text(
                'Xem thêm',
                style: AppTypography.primaryBlueBold,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 12.h,
        ),
        Row(
          children: [
            AnimatedRatingStars(
              initialRating: 4,
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
              '4',
              style: AppTypography.hintTextStyleBold,
            ),
            SizedBox(
              width: 12.w,
            ),
            Text(
              '(5 Review)',
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
              backgroundImage: const AssetImage('assets/images/avatar.png'),
            ),
            SizedBox(
              width: 12.0.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Lê Hữu Hiệp',
                  style: AppTypography.primaryDarkBlueBold,
                ),
                AnimatedRatingStars(
                  initialRating: 4,
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
          height: 12.h,
        ),
        Text(
          'air max are always very comfortable fit, clean and just perfect in every way. just the box was too small and scrunched the sneakers up a little bit, not sure if the box was always this small but the 90s are and will always be one of my favorites.',
          style: AppTypography.hintTextStyle,
        ),
        SizedBox(
          height: 12.h,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: urlImages.asMap().entries.map((element) {
              return Container(
                margin: EdgeInsets.only(right: 20.w),
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
  }
}
