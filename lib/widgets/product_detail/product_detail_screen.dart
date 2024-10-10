import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/theme/app_colors.dart';
import 'package:share_buy/application/theme/app_typography.dart';
import 'package:share_buy/models/product/product_model.dart';
import 'package:share_buy/widgets/component/custom_button.dart';
import 'package:share_buy/widgets/product_detail/children/color_selection.dart';
import 'package:share_buy/widgets/product_detail/children/image_slider.dart';
import 'package:share_buy/widgets/product_detail/children/product_description.dart';
import 'package:share_buy/widgets/product_detail/children/rate_comment.dart';
import 'package:share_buy/widgets/product_detail/children/size_selection.dart';
import 'package:share_buy/widgets/product_detail/children/suggest_product.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductModel product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Image.asset(
            'assets/icons/icon_back.png',
            width: 24.w,
            height: 24.h,
          ),
        ),
        title: Text(
          widget.product.payload?.productName ?? '',
          style: AppTypography.headerAppbarStyle,
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/icons/icon_search.png',
              width: 24.w,
              height: 24.h,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/icons/icon_three_dot_ver.png',
              width: 24.w,
              height: 24.h,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ImageSlider(
                        product: widget.product,
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              widget.product.payload?.productName ?? '',
                              style: AppTypography.headerAppbarStyle,
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                'assets/icons/icon_favourite.png',
                                width: 24.w,
                                height: 24.h,
                              )),
                        ],
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
                        "\$" "${widget.product.payload?.price ?? ''}",
                        style: AppTypography.largeBlueBold,
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      SizeSelection(),
                      SizedBox(
                        height: 24.h,
                      ),
                      ColorSelection(),
                      SizedBox(
                        height: 24.h,
                      ),
                      ProductDescription(),
                      SizedBox(
                        height: 24.h,
                      ),
                      RateComment(
                        product: widget.product,
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      SuggestProduct(),
                      SizedBox(
                        height: 12.h,
                      ),
                    ],
                  ),
                ),
              ),
              CustomButton(
                  buttonColor: AppColors.buttonBlue,
                  buttonText: 'Thêm vào giỏ',
                  onTap: () {},
                  textColor: AppColors.white)
            ],
          ),
        ),
      ),
    );
  }
}
