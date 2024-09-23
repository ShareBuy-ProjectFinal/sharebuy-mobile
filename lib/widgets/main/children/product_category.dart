import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/theme/app_colors.dart';
import 'package:share_buy/application/theme/app_typography.dart';

class ProductCategory extends StatefulWidget {
  const ProductCategory({super.key});

  @override
  State<ProductCategory> createState() => _ProductCategoryState();
}

class _ProductCategoryState extends State<ProductCategory> {
  List<String> titles = [
    'Áo nam',
    'Váy',
    'Công sở',
    'Túi xách nữ',
    'Áo nam',
    'Váy',
    'Công sở',
    'Túi xách nữ'
  ];
  List<String> iconCaegory = [
    'assets/icons/icon_tshirt.png',
    'assets/icons/icon_dress.png',
    'assets/icons/icon_tshirt.png',
    'assets/icons/icon_dress.png',
    'assets/icons/icon_tshirt.png',
    'assets/icons/icon_dress.png',
    'assets/icons/icon_tshirt.png',
    'assets/icons/icon_dress.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Phân loại',
              style: AppTypography.primaryDarkBlueBold,
            ),
            Text(
              'Xem thêm',
              style: AppTypography.primaryBlueBold,
            ),
          ],
        ),
        SizedBox(
          height: 12.h,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: titles.asMap().entries.map((element) {
              return Container(
                margin: EdgeInsets.only(right: 20.w),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(24.r),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: AppColors.borderTextfieldColor)),
                      child: Image.asset(
                        iconCaegory[element.key],
                        width: 24.w,
                        height: 24.h,
                      ),
                    ),
                    Text(
                      titles[element.key],
                      style: AppTypography.hintTextStyle,
                    )
                  ],
                ),
              );
              ;
            }).toList(),
          ),
        ),
      ],
    );
  }
}
