import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/theme/app_colors.dart';
import 'package:share_buy/application/theme/app_typography.dart';
import 'package:share_buy/widgets/component/custom_button.dart';

class StarButton extends StatefulWidget {
  const StarButton({super.key});

  @override
  State<StarButton> createState() => _StarButtonState();
}

class _StarButtonState extends State<StarButton> {
  final List<int> starts = [0, 1, 2, 3, 4, 5];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: starts.asMap().entries.map((element) {
          return element.key != 0
              ? GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(right: 12.w),
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.borderTextfieldColor,
                      ),
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: AppColors.yellow,
                          size: 16.sp,
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Text(
                          '${element.value}',
                          style: AppTypography.hintTextStyle,
                        )
                      ],
                    ),
                  ),
                )
              : GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(right: 12.w),
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                    decoration: BoxDecoration(
                      color: AppColors.lightBlue,
                      border: Border.all(
                        color: AppColors.borderTextfieldColor,
                      ),
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Tất cả',
                          style: AppTypography.mediumBlueBold,
                        )
                      ],
                    ),
                  ),
                );
        }).toList(),
      ),
    );
  }
}
