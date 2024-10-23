import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/theme/app_colors.dart';
import 'package:share_buy/application/theme/app_typography.dart';
import 'package:share_buy/utils/format.dart';
import 'package:share_buy/widgets/component/custom_button.dart';

enum OrderedItemType {
  toPay,
  toShip,
  toReceive,
  toReturn,
  toCancal,
}

class OrderedItem extends StatefulWidget {
  OrderedItemType typeOrdered;
  OrderedItem({super.key, this.typeOrdered = OrderedItemType.toPay});

  @override
  State<OrderedItem> createState() => _OrderedItemState();
}

class _OrderedItemState extends State<OrderedItem> {
  @override
  Widget build(BuildContext context) {
    String textType = widget.typeOrdered == OrderedItemType.toPay
        ? 'Chờ thanh toán'
        : widget.typeOrdered == OrderedItemType.toShip
            ? 'Chờ giao hàng'
            : widget.typeOrdered == OrderedItemType.toReceive
                ? 'Đã nhận'
                : widget.typeOrdered == OrderedItemType.toReturn
                    ? 'Đã trả hàng'
                    : 'Đã hủy';
    return Column(
      children: [
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 2,
          separatorBuilder: (context, index) => Divider(
            height: 15.h,
            thickness: 2.h,
          ),
          itemBuilder: (context, index) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Shop Lê Hữu Hiệp',
                    style: AppTypography.largeDarkBlueBold,
                  ),
                  Text(
                    textType,
                    style: AppTypography.mediumBlueBold,
                  ),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  height: 10.h,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return IntrinsicHeight(
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/bag_1.png',
                          width: 80.w,
                          height: 80.h,
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                // 'T-Shirt',
                                'Loại: màu đen, size M Loại: màu đen, size MLoại: màu đen, size M',
                                style: AppTypography.primaryDarkBlueBold,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 6.h,
                              ),
                              Text(
                                'Loại: màu đen, size M Loại: màu đen, size MLoại: màu đen, size M',
                                style: AppTypography.hintTextStyle,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 6.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    Format.formatNumber(100000),
                                    style: AppTypography.hintTextStyleBold,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    'x3',
                                    style: AppTypography.hintTextStyle,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: 2,
              ),
              SizedBox(
                height: 7.h,
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Tổng tiền (4 sản phẩm):',
              style: AppTypography.primaryHintTextBold,
            ),
            SizedBox(
              width: 8.w,
            ),
            Text(
              Format.formatMoney('300000'),
              style: AppTypography.largeBlack,
            ),
          ],
        ),
        SizedBox(
          height: 8.h,
        ),
      ],
    );
  }
}
