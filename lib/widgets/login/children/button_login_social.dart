import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/theme/app_colors.dart';
import 'package:share_buy/application/theme/app_typography.dart';

class ButtonLoginSocial extends StatefulWidget {
  final VoidCallback onTap;
  final String buttonText;
  final String iconUrl;
  const ButtonLoginSocial(
      {super.key,
      required this.onTap,
      required this.buttonText,
      required this.iconUrl});

  @override
  State<ButtonLoginSocial> createState() => _ButtonLoginSocialState();
}

class _ButtonLoginSocialState extends State<ButtonLoginSocial> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.all(16.0.w),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.borderTextfieldColor),
          borderRadius: BorderRadius.circular(5.w),
        ),
        child: Center(
          child: Row(
            children: [
              Image.asset(
                widget.iconUrl,
                width: 24.w,
                height: 24.h,
              ),
              SizedBox(
                width: 60.w,
              ),
              Text(
                widget.buttonText,
                style: AppTypography.hintTextStyleBold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
