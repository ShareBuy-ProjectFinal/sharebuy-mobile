import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/theme/app_colors.dart';
import 'package:share_buy/application/theme/app_typography.dart';

class ColorSelection extends StatefulWidget {
  const ColorSelection({super.key});

  @override
  State<ColorSelection> createState() => _ColorSelectionState();
}

class _ColorSelectionState extends State<ColorSelection> {
  final List<Color> colors = [
    AppColors.redLight,
    AppColors.buttonBlue,
    AppColors.hintTextColor,
    AppColors.primary,
    AppColors.textDartBlue
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Chọn màu',
          style: AppTypography.primaryDarkBlueBold,
        ),
        SizedBox(
          height: 12.h,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: colors.asMap().entries.map((element) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = element.key;
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(right: 20.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(24.r),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: element.value),
                        child: selectedIndex == element.key
                            ? Container(
                                padding: EdgeInsets.all(8.r),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.white),
                              )
                            : Container(
                                padding: EdgeInsets.all(8.r),
                              ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
