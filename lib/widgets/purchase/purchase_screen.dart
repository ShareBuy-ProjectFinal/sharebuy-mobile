import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:share_buy/application/theme/app_colors.dart';
import 'package:share_buy/application/theme/app_typography.dart';

class PurchaseScreen extends StatefulWidget {
  const PurchaseScreen({super.key});

  @override
  State<PurchaseScreen> createState() => _PurchaseScreenState();
}

class _PurchaseScreenState extends State<PurchaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.white,
        title: Text(
          'Thanh toán',
          style: AppTypography.headerAppbarStyle,
        ),
        // centerTitle: false,
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: AppColors.hintTextColor),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Địa chỉ nhận hàng',
                      style: AppTypography.headerAppbarStyle,
                    ),
                    Text(
                      'Thay đổi',
                      style: AppTypography.headerAppbarStyle,
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
