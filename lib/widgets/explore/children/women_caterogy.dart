import 'package:auto_height_grid_view/auto_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/theme/app_colors.dart';
import 'package:share_buy/application/theme/app_typography.dart';

class WomenCaterogy extends StatefulWidget {
  const WomenCaterogy({super.key});

  @override
  State<WomenCaterogy> createState() => _WomenCaterogyState();
}

class _WomenCaterogyState extends State<WomenCaterogy> {
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Thời trang nữ',
          style: AppTypography.primaryDarkBlueBold,
        ),
        AutoHeightGridView(
          itemCount: titles.length,
          crossAxisCount: 4,
          mainAxisSpacing: 10.h,
          crossAxisSpacing: 10.w,
          padding: EdgeInsets.symmetric(vertical: 10.h),
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          builder: (context, index) {
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
                        border:
                            Border.all(color: AppColors.borderTextfieldColor)),
                    child: Image.asset(
                      iconCaegory[index],
                      width: 24.w,
                      height: 24.h,
                    ),
                  ),
                  Text(
                    titles[index],
                    style: AppTypography.hintTextStyle,
                  )
                ],
              ),
            );
          },
        )
      ],
    );
  }
}
