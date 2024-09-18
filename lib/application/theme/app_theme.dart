import 'package:flutter/material.dart';
import 'package:source_tms/application/theme/app_colors.dart';

ThemeData appTheme = ThemeData(
    primaryColor: AppColors.primary,
    indicatorColor: AppColors.primary,
    scrollbarTheme: ScrollbarThemeData(
      thickness: WidgetStateProperty.resolveWith((value) => 0.0),
    ),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: AppColors.textBlack),
      backgroundColor: AppColors.primary,
      titleTextStyle: TextStyle(
        color: AppColors.textBlack,
        fontSize: 18,
        fontWeight: FontWeight.w800,
      ),
    ),
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap
    );
