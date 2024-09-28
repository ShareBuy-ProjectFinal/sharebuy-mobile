import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/theme/app_typography.dart';

class ProductDescription extends StatefulWidget {
  const ProductDescription({super.key});

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Mô tả',
          style: AppTypography.primaryDarkBlueBold,
        ),
        SizedBox(
          height: 12.h,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Shown:',
              style: AppTypography.hintTextStyle,
            ),
            Text(
              'Laser \nBlue/Anthracite/Watermelon\n/White',
              style: AppTypography.hintTextStyle,
              textAlign: TextAlign.end,
            )
          ],
        ),
        SizedBox(
          height: 12.h,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Style:',
              style: AppTypography.hintTextStyle,
            ),
            Text(
              'CD0113-400',
              style: AppTypography.hintTextStyle,
              textAlign: TextAlign.end,
            )
          ],
        ),
        SizedBox(
          height: 12.h,
        ),
        Text(
          'The Nike Air Max 270 React ENG combines a full-length React foam midsole with a 270 Max Air unit for unrivaled comfort and a striking visual experience.',
          style: AppTypography.hintTextStyle,
        )
      ],
    );
  }
}
