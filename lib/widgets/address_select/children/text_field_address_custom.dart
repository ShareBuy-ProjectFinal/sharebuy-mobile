import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/theme/app_typography.dart';
import 'package:share_buy/utils/help_function.dart';

class TextFieldAddressCustom extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  const TextFieldAddressCustom(
      {super.key, required this.hintText, required this.controller});

  @override
  State<TextFieldAddressCustom> createState() => _TextFieldAddressCustomState();
}

class _TextFieldAddressCustomState extends State<TextFieldAddressCustom> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 1,
      maxLength: 50,
      onTapOutside: (event) {
        HelpFunction.removeFocus(context);
      },
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: AppTypography.primaryHintText,
        contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
        // isCollapsed: true,
        // isDense: true,
        counterText: '',
      ),
    );
  }
}
