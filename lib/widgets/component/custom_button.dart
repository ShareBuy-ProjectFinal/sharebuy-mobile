import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/theme/app_colors.dart';

class CustomButton extends StatefulWidget {
  final Color buttonColor;
  final String buttonText;
  final Color textColor;
  final Color? borderColor;
  final double? fontSize;
  final bool isDisable;
  final VoidCallback onTap;
  final EdgeInsets? padding;
  const CustomButton(
      {Key? key,
      required this.buttonColor,
      required this.buttonText,
      required this.onTap,
      required this.textColor,
      this.borderColor,
      this.fontSize,
      bool disable = false,
      this.padding})
      : isDisable = disable, // Gán giá trị cho thuộc tính isDisable
        super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.isDisable ? null : widget.onTap,
      child: Container(
        padding: widget.padding ?? EdgeInsets.all(16.0.w),
        decoration: BoxDecoration(
          color: widget.isDisable ? AppColors.colorDisable : widget.buttonColor,
          borderRadius: BorderRadius.circular(5.w),
          border: Border.all(
            color: widget.isDisable
                ? AppColors.colorDisable
                : widget.borderColor ?? widget.textColor,
          ),
        ),
        child: Center(
          child: Text(
            widget.buttonText,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: widget.isDisable ? AppColors.white : widget.textColor,
                fontSize: widget.fontSize ?? 12.sp),
          ),
        ),
      ),
    );
  }
}
