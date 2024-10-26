import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/theme/app_typography.dart';
import 'package:share_buy/models/cart/cart_item_model.dart';
import 'package:share_buy/utils/format.dart';
import 'package:share_buy/widgets/component/CustomCachedNetworkImage.dart';

class PurchaseShopItem extends StatefulWidget {
  CartItemModel cartItem;
  PurchaseShopItem({super.key, required this.cartItem});

  @override
  State<PurchaseShopItem> createState() => _PurchaseShopItemState();
}

class _PurchaseShopItemState extends State<PurchaseShopItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: IntrinsicHeight(
        child: Row(
          children: [
            CustomCachedNetworkImage(
                imageUrl:
                    widget.cartItem.productDetail.image ?? 'default_image_url',
                width: 80,
                height: 80),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.cartItem.productDetail.name ?? 'Product name',
                    style: AppTypography.primaryDarkBlueBold,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    'Phân loại: ${widget.cartItem.productDetail.getAttributeValuesName()}',
                    style: AppTypography.primaryHintText,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${Format.formatNumber(
                          widget.cartItem.productDetail.price,
                        )} vnđ",
                        style: AppTypography.primaryHintText,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text('x${widget.cartItem.quantity}',
                          style: AppTypography.primaryHintText),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
