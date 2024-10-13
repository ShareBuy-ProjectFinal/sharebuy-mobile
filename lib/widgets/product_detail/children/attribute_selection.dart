import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/theme/app_typography.dart';

class AttributeSelection extends StatefulWidget {
  final String productDetailId;
  const AttributeSelection({super.key, required this.productDetailId});

  @override
  State<AttributeSelection> createState() => _AttributeSelectionState();
}

class _AttributeSelectionState extends State<AttributeSelection> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'Chọn kích cỡ',
        style: AppTypography.primaryDarkBlueBold,
      ),
      SizedBox(
        height: 12.h,
      ),
      Wrap(
        children: [],
      )
    ]);
  }
}
