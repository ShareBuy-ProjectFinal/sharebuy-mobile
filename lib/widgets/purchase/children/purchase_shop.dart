import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/theme/app_typography.dart';
import 'package:share_buy/models/cart/cart_item_model.dart';
import 'package:share_buy/models/cart/cart_model.dart';
import 'package:share_buy/utils/format.dart';
import 'package:share_buy/widgets/component/custom_textfield.dart';
import 'package:share_buy/widgets/purchase/children/purchase_shop_item.dart';
import 'package:share_buy/widgets/purchase/children/shipping_fee.dart';
import 'package:share_buy/widgets/purchase/children/vourch_shop.dart';

// ignore: must_be_immutable
class PurchaseShop extends StatefulWidget {
  CartModel cart;
  PurchaseShop({super.key, required this.cart});

  @override
  State<PurchaseShop> createState() => _PurchaseShopState();
}

class _PurchaseShopState extends State<PurchaseShop> {
  @override
  Widget build(BuildContext context) {
    // widget.cart.cartItems?.total();
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Text(
              widget.cart.shop?.fullName ?? 'Shop name',
              style: AppTypography.headerAppbarStyle,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => PurchaseShopItem(
                    cartItem: widget.cart.cartItems![index],
                  ),
              separatorBuilder: (context, index) => SizedBox(
                    height: 10.h,
                  ),
              itemCount: widget.cart.cartItems?.length ?? 0),
          SizedBox(
            height: 7.h,
          ),
          VourchShop(),
          SizedBox(
            height: 10.h,
          ),
          ShippingFee(),
          Divider(),
          Padding(
            padding:
                EdgeInsets.only(left: 15.w, right: 15.w, top: 5.h, bottom: 5.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Lời nhắn cho Shop', style: AppTypography.primaryBlack),
                Text('Để lại lời nhắn', style: AppTypography.primaryHintText),
              ],
            ),
          ),
          Divider(),
          Padding(
            padding:
                EdgeInsets.only(left: 15.w, right: 15.w, top: 5.h, bottom: 5.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    'Tổng tiền (${widget.cart.cartItems?.length ?? 0} sản phẩm)',
                    style: AppTypography.primaryBlack),
                Text(
                    "${Format.formatNumber(widget.cart.cartItems!.total() + 32000)} vnđ",
                    style: AppTypography.primaryDarkBlueBold),
              ],
            ),
          )
        ],
      ),
    );
  }
}
