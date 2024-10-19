import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/widgets/purchase/children/shop_order.dart';

class TabPurchase extends StatefulWidget {
  const TabPurchase({super.key});

  @override
  State<TabPurchase> createState() => _TabPurchaseState();
}

class _TabPurchaseState extends State<TabPurchase> {
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
