// ignore_for_file: must_be_immutable

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/theme/app_colors.dart';
import 'package:share_buy/application/theme/app_typography.dart';
import 'package:share_buy/main.dart';

class CustomDropdown extends StatefulWidget {
  final List<ItemDropdown> items;
  final String title;
  final Color titleTextColor;
  final Color? backgroundColor;
  final Color? iconColor;
  final BorderRadius? borderRadius;
  const CustomDropdown({
    super.key,
    required this.items,
    required this.title,
    required this.titleTextColor,
    this.backgroundColor,
    this.iconColor,
    this.borderRadius,
  });

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        iconStyleData: const IconStyleData(iconSize: 0),
        isExpanded: true,
        hint: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  widget.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.primaryDarkBlueBold,
                ),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: widget.iconColor ?? AppColors.buttonBlue,
              ),
            ],
          ),
        ),
        items: List.generate(widget.items.length, (index) {
          final item = widget.items[index];
          return DropdownMenuItem<String>(
            onTap: () => item.onTap,
            value: item.name,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Text(
                    item.name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDartBlue,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (index != widget.items.length - 1)
                  const Divider(
                    color: AppColors.hintTextColor,
                    height: 1,
                  ),
              ],
            ),
          );
        }),
        onChanged: (value) {},
        buttonStyleData: ButtonStyleData(width: 154.w),
        dropdownStyleData: const DropdownStyleData(
          maxHeight: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(9),
              bottomRight: Radius.circular(9),
            ),
            color: AppColors.white,
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          padding: EdgeInsets.all(0),
          height: 40,
        ),
      ),
    );
  }
}

class ItemDropdown {
  String name;
  VoidCallback onTap;

  ItemDropdown({required this.name, required this.onTap});
}
