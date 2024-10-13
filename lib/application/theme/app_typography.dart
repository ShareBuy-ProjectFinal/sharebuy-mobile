import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/theme/app_colors.dart';

class AppTypography {
  static final hintTextStyle = TextStyle(
      fontWeight: FontWeight.w400,
      color: AppColors.hintTextColor,
      fontSize: 12.sp);

  static final hintTextStyleBold = TextStyle(
      fontWeight: FontWeight.w700,
      color: AppColors.hintTextColor,
      fontSize: 12.sp);

  static final headerAppbarStyle = TextStyle(
      fontWeight: FontWeight.w700,
      color: AppColors.textDartBlue,
      fontSize: 16.sp);

  static final primaryDarkBlueBold = TextStyle(
      fontWeight: FontWeight.w700,
      color: AppColors.textDartBlue,
      fontSize: 14.sp);

  static final primaryBlueBold = TextStyle(
      fontWeight: FontWeight.w700,
      color: AppColors.buttonBlue,
      fontSize: 12.sp);
  static final largeBlueBold = TextStyle(
      fontWeight: FontWeight.w700,
      color: AppColors.buttonBlue,
      fontSize: 16.sp);
  static final primaryWhiteBold = TextStyle(
      fontWeight: FontWeight.w700, color: AppColors.white, fontSize: 12.sp);

  static final primaryRedBold = TextStyle(
      fontWeight: FontWeight.w700, color: AppColors.redLight, fontSize: 14.sp);

  static final primaryLineThrough = TextStyle(
      fontWeight: FontWeight.w400,
      color: AppColors.hintTextColor,
      fontSize: 16.sp,
      decoration: TextDecoration.lineThrough);
}
