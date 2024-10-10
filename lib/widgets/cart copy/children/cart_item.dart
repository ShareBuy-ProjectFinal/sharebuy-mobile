import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/theme/app_typography.dart';
import 'package:share_buy/models/product_model.dart';

class CartItem extends StatefulWidget {
  // final ProductModel product;
  // final bool isShowIconRemove;
  // final bool haveMargin;
  // final bool isOnHorizontalList;
  const CartItem({super.key});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(bottom: 10.h),
        child: Row(
          children: [
            Checkbox(
              value: true,
              onChanged: (v) {},
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  border: Border.all(color: Colors.grey),
                ),
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/bag_1.png',
                      // 'assets/images/flash_sale_panel.png',
                      width: 100.w,
                      height: 80.h,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisSize: MainAxisSize.min,
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Túi xách',
                            style: AppTypography.primaryDarkBlueBold,
                          ),
                          Text(
                            'Đỏ, XL',
                            style: AppTypography.primaryDarkBlueBold,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '10.000 vnđ',
                                style: AppTypography.primaryBlueBold,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Row(
                                children: [
                                  Text(
                                    '-',
                                    style: AppTypography.hintTextStyle,
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    '+',
                                    style: AppTypography.hintTextStyle,
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
