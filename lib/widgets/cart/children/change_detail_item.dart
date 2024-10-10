import 'package:flutter/material.dart';
import 'package:share_buy/application/theme/app_colors.dart';

class ChangeDetailItem extends StatefulWidget {
  final String productDetailId;
  const ChangeDetailItem({super.key, required this.productDetailId});

  @override
  State<ChangeDetailItem> createState() => _ChangeDetailItemState();
}

class _ChangeDetailItemState extends State<ChangeDetailItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 400,
                width: double.maxFinite,
                color: AppColors.white,
                child: const Column(
                  children: [
                    SizedBox(height: 10),
                    Text('Chọn màu sắc'),
                    SizedBox(height: 10),
                  ],
                ),
              );
            });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        decoration: BoxDecoration(
            color: AppColors.borderTextfieldColor,
            borderRadius: BorderRadius.circular(5)),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Trắng'),
            Icon(Icons.expand_more),
          ],
        ),
      ),
    );
  }
}
