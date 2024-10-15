import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/theme/app_typography.dart';
import 'package:share_buy/models/product_model.dart';
import 'package:share_buy/widgets/cart/children/change_detail_item.dart';
import 'package:share_buy/widgets/component/custom_button_action.dart';

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
  int _quantity = 1;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        child: IntrinsicHeight(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Checkbox(
                value: true,
                onChanged: (v) {},
              ),
              Image.asset(
                fit: BoxFit.cover,
                'assets/images/bag_1.png',
                // 'assets/images/flash_sale_panel.png',
                width: 100.w,
                height: 80.h,
              ),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Túi xách',
                      style: AppTypography.primaryDarkBlueBold,
                    ),
                    ChangeDetailItem(productDetailId: 'productDetailId'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '10.000 vnđ',
                          style: AppTypography.primaryRedBold,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Row(
                          children: [
                            CustomButtonAction(
                              icon: Icons.remove,
                              onTap: () {
                                if (_quantity > 1) {
                                  setState(() {
                                    _quantity--;
                                  });
                                }
                              },
                              isLeftRadius: true,
                            ),
                            Container(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                constraints: BoxConstraints(
                                  minWidth: 30.w,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                ),
                                child: Center(
                                  child: Text(
                                    _quantity.toString(),
                                    style: AppTypography.primaryDarkBlueBold,
                                  ),
                                )),
                            CustomButtonAction(
                                icon: Icons.add,
                                onTap: () {
                                  setState(() {
                                    _quantity++;
                                  });
                                }),
                            SizedBox(
                              width: 8.w,
                            ),
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
      ),
    );
  }
}
