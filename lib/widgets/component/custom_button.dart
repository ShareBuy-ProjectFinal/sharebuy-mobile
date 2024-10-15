import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatefulWidget {
  final Color buttonColor;
  final String buttonText;
  final Color textColor;
  final bool isDisable;
  final VoidCallback onTap;
  final EdgeInsets? padding;
  const CustomButton(
      {Key? key,
      required this.buttonColor,
      required this.buttonText,
      required this.onTap,
      required this.textColor,
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
          color: widget.isDisable ? Colors.grey.shade400 : widget.buttonColor,
          borderRadius: BorderRadius.circular(5.w),
        ),
        child: Center(
          child: Text(
            widget.buttonText,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: widget.isDisable ? Colors.white : widget.textColor,
                fontSize: 12.sp),
          ),
        ),
      ),
    );
  }
}
