import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatefulWidget {
  final Color buttonColor;
  final String buttonText;
  final Color textColor;
  final VoidCallback onTap;
  const CustomButton(
      {super.key,
      required this.buttonColor,
      required this.buttonText,
      required this.onTap,
      required this.textColor});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.all(16.0.w),
        decoration: BoxDecoration(
          color: widget.buttonColor,
          borderRadius: BorderRadius.circular(5.w),
        ),
        child: Center(
          child: Text(
            widget.buttonText,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: widget.textColor,
                fontSize: 12.sp),
          ),
        ),
      ),
    );
  }
}
