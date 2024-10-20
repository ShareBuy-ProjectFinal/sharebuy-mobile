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

  // BlackBold
  static final smallDarkBlueBold = TextStyle(
      fontWeight: FontWeight.w700,
      color: AppColors.textDartBlue,
      fontSize: 10.sp);

  static final mediumDarkBlueBold = TextStyle(
      fontWeight: FontWeight.w700,
      color: AppColors.textDartBlue,
      fontSize: 12.sp);

  static final primaryDarkBlueBold = TextStyle(
      fontWeight: FontWeight.w700,
      color: AppColors.textDartBlue,
      fontSize: 14.sp);

  static final primaryDarkBlueBoldDisable = TextStyle(
      fontWeight: FontWeight.w700, color: Colors.grey, fontSize: 14.sp);

  // RedBold
  static final smallRedBold = TextStyle(
      fontWeight: FontWeight.w700, color: AppColors.redLight, fontSize: 10.sp);

  static final mediumRedBold = TextStyle(
      fontWeight: FontWeight.w700, color: AppColors.redLight, fontSize: 12.sp);

  static final primaryRedBold = TextStyle(
      fontWeight: FontWeight.w700, color: AppColors.redLight, fontSize: 14.sp);

  static final largeRedBold = TextStyle(
      fontWeight: FontWeight.w700, color: AppColors.redLight, fontSize: 16.sp);

  // BlueBold
  static final primaryBlueBold = TextStyle(
      fontWeight: FontWeight.w700,
      color: AppColors.buttonBlue,
      fontSize: 12.sp);

  static final largeBlueBold = TextStyle(
      fontWeight: FontWeight.w700,
      color: AppColors.buttonBlue,
      fontSize: 16.sp);

  // WhiteBold
  static final primaryWhiteBold = TextStyle(
      fontWeight: FontWeight.w700, color: AppColors.white, fontSize: 12.sp);

  // LineThrough
  static final smallLineThrough = TextStyle(
      fontWeight: FontWeight.w400,
      color: AppColors.hintTextColor,
      fontSize: 10.sp,
      decoration: TextDecoration.lineThrough);

  static final mediumLineThrough = TextStyle(
      fontWeight: FontWeight.w400,
      color: AppColors.hintTextColor,
      fontSize: 12.sp,
      decoration: TextDecoration.lineThrough);

  static final primaryLineThrough = TextStyle(
      fontWeight: FontWeight.w400,
      color: AppColors.hintTextColor,
      fontSize: 14.sp,
      decoration: TextDecoration.lineThrough);

  static final largeLineThrough = TextStyle(
      fontWeight: FontWeight.w400,
      color: AppColors.hintTextColor,
      fontSize: 16.sp,
      decoration: TextDecoration.lineThrough);
}
