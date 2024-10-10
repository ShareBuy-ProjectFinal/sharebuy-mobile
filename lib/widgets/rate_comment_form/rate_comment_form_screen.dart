import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/theme/app_colors.dart';
import 'package:share_buy/application/theme/app_typography.dart';
import 'package:share_buy/widgets/component/custom_button.dart';
import 'package:share_buy/widgets/component/custom_textfield.dart';

class RateCommentFormScreen extends StatefulWidget {
  const RateCommentFormScreen({super.key});

  @override
  State<RateCommentFormScreen> createState() => _RateCommentFormScreenState();
}

class _RateCommentFormScreenState extends State<RateCommentFormScreen> {
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
          'Viết đánh giá',
          style: AppTypography.headerAppbarStyle,
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Vui lòng viết mức độ hài lòng chung với Dịch vụ vận chuyển / giao hàng của bạn',
                    style: AppTypography.primaryDarkBlueBold,
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
                        starSize: 32.sp,
                        readOnly: true,
                      ),
                      SizedBox(
                        width: 12.0.w,
                      ),
                      Text(
                        '4/5',
                        style: AppTypography.primaryDarkBlueBold,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text('Viết đánh giá của bạn',
                      style: AppTypography.primaryDarkBlueBold),
                  SizedBox(
                    height: 12.h,
                  ),
                  CustomTextfield(
                      hintText: 'Viết tại đây',
                      maxLines: 5,
                      controller: TextEditingController()),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text('Thêm hình ảnh',
                      style: AppTypography.primaryDarkBlueBold),
                  SizedBox(
                    height: 12.h,
                  ),
                  Container(
                    width: 72.w,
                    height: 72.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      shape: BoxShape.rectangle,
                      border: Border.all(color: AppColors.borderTextfieldColor),
                    ),
                    child: Icon(
                      Icons.add,
                      color: AppColors.hintTextColor,
                      size: 30.sp,
                    ),
                  )
                ],
              ),
              CustomButton(
                buttonColor: AppColors.buttonBlue,
                buttonText: 'Gửi đánh giá',
                onTap: () {},
                textColor: AppColors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
