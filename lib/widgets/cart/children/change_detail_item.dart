import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/theme/app_colors.dart';
import 'package:share_buy/application/theme/app_typography.dart';
import 'package:share_buy/main.dart';
import 'package:share_buy/widgets/cart/children/cart_item_attribute.dart';
import 'package:share_buy/widgets/component/custom_button_action.dart';

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
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          Image.asset(
                            fit: BoxFit.cover,
                            'assets/images/bag_1.png',
                            // 'assets/images/flash_sale_panel.png',
                            width: 100.w,
                            height: 100.h,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'đ500.000',
                                    style: AppTypography.primaryLineThrough,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    'đ400.000',
                                    style: AppTypography.primaryRedBold,
                                  ),
                                ],
                              ),
                              const Text('Kho: 1000'),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    const Divider(
                      color: AppColors.borderTextfieldColor,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    ListView.separated(
                      itemCount: 2,
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 5,
                      ),
                      itemBuilder: (context, index) {
                        return CartItemAttribute();
                      },
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Số lượng'),
                        Row(
                          children: [
                            CustomButtonAction(
                              icon: Icons.remove,
                              onTap: () {},
                              isLeftRadius: true,
                            ),
                            Container(
                              width: 30.w,
                              height: 30.h,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.textBlack,
                                ),
                              ),
                              child: Center(
                                child: Text('1'),
                              ),
                            ),
                            CustomButtonAction(
                              icon: Icons.add,
                              onTap: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
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
