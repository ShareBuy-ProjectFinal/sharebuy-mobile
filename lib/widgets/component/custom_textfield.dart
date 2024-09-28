import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/theme/app_colors.dart';
import 'package:share_buy/application/theme/app_typography.dart';
import 'package:share_buy/utils/help_function.dart';

class CustomTextfield extends StatefulWidget {
  final double? height;
  final String hintText;
  final String iconUrl;
  final TextEditingController controller;
  const CustomTextfield(
      {super.key,
      this.height,
      required this.hintText,
      required this.iconUrl,
      required this.controller});

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onTapOutside: (event) {
        HelpFunction.removeFocus(context);
      },
      controller: widget.controller,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0.r)),
            borderSide: const BorderSide(color: AppColors.buttonBlue)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0.r)),
            borderSide:
                const BorderSide(color: AppColors.borderTextfieldColor)),
        contentPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
        border: InputBorder.none,
        hintText: widget.hintText,
        hintStyle: AppTypography.hintTextStyle,
        isCollapsed: true,
        isDense: true,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(
            widget.iconUrl,
            width: 12.w,
            height: 12.h,
          ),
        ),
      ),
      textAlignVertical: TextAlignVertical.center,
    );
  }
}
