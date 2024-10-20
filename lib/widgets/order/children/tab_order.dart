import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/widgets/order/children/shop_order.dart';

class TabOrder extends StatefulWidget {
  const TabOrder({super.key});

  @override
  State<TabOrder> createState() => _TabOrderState();
}

class _TabOrderState extends State<TabOrder> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(
        height: 10.h,
      ),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return ShopOrder();
      },
      itemCount: 4,
    );
  }
}
