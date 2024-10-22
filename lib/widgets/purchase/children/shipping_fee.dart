import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/theme/app_colors.dart';
import 'package:share_buy/application/theme/app_typography.dart';
import 'package:share_buy/utils/format.dart';

class ShippingFee extends StatefulWidget {
  const ShippingFee({super.key});

  @override
  State<ShippingFee> createState() => _ShippingFeeState();
}

class _ShippingFeeState extends State<ShippingFee> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 5.h),
      decoration: const BoxDecoration(
          // color: AppColors.colorDisable,
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Phương thức vận chuyển', style: AppTypography.primaryBlack),
          SizedBox(
            height: 5.h,
          ),
          Row(
            children: [
              Text('Giao hàng tận nơi', style: AppTypography.primaryBlack),
              Spacer(),
              Text("${Format.formatNumber(32000)} vnđ",
                  style: AppTypography.primaryBlack),
            ],
          )
        ],
      ),
    );
  }
}
