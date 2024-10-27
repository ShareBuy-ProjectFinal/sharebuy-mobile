// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/theme/app_typography.dart';
import 'package:share_buy/models/attribute/attribute_custom_value_model.dart';
import 'package:share_buy/models/order/order_item_model.dart';
import 'package:share_buy/models/order/order_model.dart';
import 'package:share_buy/utils/format.dart';
import 'package:share_buy/widgets/component/CustomCachedNetworkImage.dart';

enum OrderedItemType {
  toPay,
  preparing,
  toShip,
  toReceive,
  toReturn,
  toCancal,
}

class OrderedItem extends StatefulWidget {
  OrderedItemType typeOrdered;
  OrderModel order;
  OrderedItem(
      {super.key,
      this.typeOrdered = OrderedItemType.toPay,
      required this.order});

  @override
  State<OrderedItem> createState() => _OrderedItemState();
}

class _OrderedItemState extends State<OrderedItem> {
  @override
  Widget build(BuildContext context) {
    String textType = widget.typeOrdered == OrderedItemType.toPay
        ? 'Chờ thanh toán'
        : widget.typeOrdered == OrderedItemType.preparing
            ? 'Đang chuẩn bị'
            : widget.typeOrdered == OrderedItemType.toShip
                ? 'Chờ giao hàng'
                : widget.typeOrdered == OrderedItemType.toReceive
                    ? 'Đã nhận'
                    : widget.typeOrdered == OrderedItemType.toReturn
                        ? 'Đã trả hàng'
                        : 'Đã hủy';

    return Column(
      children: [
        // ORRER GROUP SHOP
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: widget.order.type == "DEFAULT"
              ? widget.order.ordersGroupByShop?.length ?? 0
              : 1,
          separatorBuilder: (context, index) => Divider(
            height: 15.h,
            thickness: 2.h,
          ),
          itemBuilder: (context, indexOrder) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.order.type == "DEFAULT"
                        ? widget.order.ordersGroupByShop![indexOrder].shop
                                ?.fullName ??
                            widget.order.shop?.fullName ??
                            ''
                        : widget.order.shop?.fullName ?? '',
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
                separatorBuilder: (context, indexItem) => SizedBox(
                  height: 10.h,
                ),
                itemCount: widget.order.type == "DEFAULT"
                    ? widget.order.ordersGroupByShop![indexOrder].orderItems
                            ?.length ??
                        0
                    : widget.order.orderItems?.length ?? 0,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, indexItem) {
                  OrderItemModel orderItemModel = widget.order.type == "DEFAULT"
                      ? widget.order.ordersGroupByShop![indexOrder]
                          .orderItems![indexItem]
                      : widget.order.orderItems![indexItem];
                  return IntrinsicHeight(
                    child: Row(
                      children: [
                        CustomCachedNetworkImage(
                          imageUrl:
                              orderItemModel.cartItem?.productDetail.image ??
                                  '',
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
                                orderItemModel.cartItem?.productDetail.name ??
                                    '',
                                style: AppTypography.primaryDarkBlueBold,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 6.h,
                              ),
                              Text(
                                'Loại: ${orderItemModel.cartItem!.productDetail.customAttributeValues?.getAttributeValuesName() ?? ''}',
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
                                    Format.formatNumber(orderItemModel
                                        .cartItem!.productDetail.price),
                                    style: AppTypography.hintTextStyleBold,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    "x${orderItemModel.cartItem!.quantity.toString()}",
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
              'Tổng tiền (${widget.order.type == "DEFAULT" ? widget.order.getCountCartItem : widget.order.orderItems?.length ?? 0} sản phẩm):',
              style: AppTypography.primaryHintTextBold,
            ),
            SizedBox(
              width: 8.w,
            ),
            Text(
              Format.formatMoney(
                  widget.order.totalAmount?.toDouble().toString() ?? '0'),
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
