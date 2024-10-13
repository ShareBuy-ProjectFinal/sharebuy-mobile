import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/routes/navigator_name.dart';
import 'package:share_buy/widgets/component/custom_textfield.dart';
import 'package:share_buy/application/theme/app_colors.dart';
import 'package:share_buy/application/theme/app_typography.dart';
import 'package:badges/badges.dart' as badges;

class TopSearchBar extends StatefulWidget {
  const TopSearchBar({super.key});

  @override
  State<TopSearchBar> createState() => _TopSearchBarState();
}

class _TopSearchBarState extends State<TopSearchBar> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextfield(
              hintText: 'Tìm kiếm',
              iconUrl: 'assets/icons/icon_search.png',
              controller: _searchController),
        ),
        SizedBox(
          width: 8.w,
        ),
        IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed(
              NavigatorName.FAVOURITE_SCREEN,
            );
          },
          icon: Image.asset(
            'assets/icons/icon_favourite.png',
            width: 24.w,
            height: 24.h,
          ),
        ),
        SizedBox(
          width: 8.w,
        ),
        IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed(NavigatorName.NOTIFICATION_SCREEN);
          },
          icon: badges.Badge(
            badgeStyle: const badges.BadgeStyle(badgeColor: AppColors.redLight),
            badgeContent: Text(
              '3',
              style: AppTypography.primaryWhiteBold,
            ),
            child: Image.asset(
              'assets/icons/icon_ring.png',
              width: 24.w,
              height: 24.h,
              color: AppColors.hintTextColor,
            ),
          ),
        ),
      ],
    );
  }
}
