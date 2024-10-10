import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/routes/navigator_name.dart';
import 'package:share_buy/widgets/component/custom_textfield.dart';

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
          onPressed: () {},
          icon: Image.asset(
            'assets/icons/icon_sort.png',
            width: 24.w,
            height: 24.h,
          ),
        ),
        SizedBox(
          width: 8.w,
        ),
        IconButton(
          onPressed: () {},
          icon: Image.asset(
            'assets/icons/icon_filter.png',
            width: 24.w,
            height: 24.h,
          ),
        ),
      ],
    );
  }
}
