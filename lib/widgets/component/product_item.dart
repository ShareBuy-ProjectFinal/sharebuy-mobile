import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/routes/navigator_name.dart';
import 'package:share_buy/application/theme/app_colors.dart';
import 'package:share_buy/application/theme/app_typography.dart';
import 'package:share_buy/models/product_model.dart';

class ProductItem extends StatefulWidget {
  final ProductModel product;
  final bool isShowIconRemove;
  final bool haveMargin;
  final bool isOnHorizontalList;
  const ProductItem(
      {super.key,
      required this.product,
      required this.isShowIconRemove,
      required this.haveMargin,
      this.isOnHorizontalList = false});

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(NavigatorName.PRODUCT_DETAIL_SCREEN,
            arguments: {'product': widget.product});
      },
      child: Container(
        margin: widget.haveMargin
            ? EdgeInsets.only(right: 20.w)
            : const EdgeInsets.all(0),
        clipBehavior: Clip.hardEdge,
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            border: Border.all(color: AppColors.borderTextfieldColor)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              widget.product.imageUrl!,
              width: widget.isOnHorizontalList ? 133.w : double.infinity,
              height: 133.h,
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(
              widget.product.name!,
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
            SizedBox(
              height: 12.h,
            ),
            Text(
              "\$" "${widget.product.price!}",
              style: AppTypography.primaryBlueBold,
            ),
            SizedBox(
              height: 12.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "\$" "${widget.product.salePrice!}",
                      style: AppTypography.hintTextStyle,
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    Text(
                      "${widget.product.saleOffPercent!}% Off",
                      style: AppTypography.primaryRedBold,
                    ),
                  ],
                ),
                widget.isShowIconRemove
                    ? Image.asset(
                        'assets/icons/icon_remove.png',
                        width: 24.w,
                        height: 24.h,
                      )
                    : const SizedBox()
              ],
            ),
          ],
        ),
      ),
    );
  }
}