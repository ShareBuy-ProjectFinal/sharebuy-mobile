import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/theme/app_colors.dart';
import 'package:share_buy/application/theme/app_typography.dart';

class SizeSelection extends StatefulWidget {
  const SizeSelection({super.key});

  @override
  State<SizeSelection> createState() => _SizeSelectionState();
}

class _SizeSelectionState extends State<SizeSelection> {
  List<num> sizes = [35, 36, 37, 38, 39, 40, 41, 42];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Chọn kích cỡ',
          style: AppTypography.primaryDarkBlueBold,
        ),
        SizedBox(
          height: 12.h,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: sizes.asMap().entries.map((element) {
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
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: selectedIndex == element.key
                                    ? AppColors.buttonBlue
                                    : AppColors.borderTextfieldColor)),
                        child: Text(
                          '${element.value}',
                          style: AppTypography.primaryDarkBlueBold,
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
