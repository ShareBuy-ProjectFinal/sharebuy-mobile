import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_buy/application/theme/app_colors.dart';

ThemeData appTheme = ThemeData(
    textTheme: GoogleFonts.poppinsTextTheme(),
    scaffoldBackgroundColor: AppColors.white,
    primaryColor: AppColors.white,
    indicatorColor: AppColors.white,
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
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap);
