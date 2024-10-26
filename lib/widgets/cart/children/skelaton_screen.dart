import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/theme/app_colors.dart';
import 'package:share_buy/application/theme/app_typography.dart';
import 'package:share_buy/models/cart/cart_item_model.dart';
import 'package:share_buy/models/product/product_detail_model.dart';
import 'package:share_buy/utils/format.dart';
import 'package:share_buy/widgets/cart/children/cart_item.dart';
import 'package:share_buy/widgets/cart/children/cart_shop_item.dart';
import 'package:share_buy/widgets/component/custom_button.dart';

class SkelatonScreen extends StatefulWidget {
  const SkelatonScreen({super.key});

  @override
  State<SkelatonScreen> createState() => _SkelatonScreenState();
}

class _SkelatonScreenState extends State<SkelatonScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
              padding: EdgeInsets.only(left: 10.w, right: 10.w),
              decoration: const BoxDecoration(color: AppColors.backgroundGrey),
              child: ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                separatorBuilder: (context, index) => SizedBox(height: 10.h),
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                        margin: const EdgeInsets.all(1.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            // border: Border.all(color: Colors.grey),
                            color: AppColors.white),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  onChanged: (v) {},
                                  value: false,
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      Flexible(
                                        child: Text(
                                          'Name shop',
                                          style:
                                              AppTypography.primaryDarkBlueBold,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ),
                                      const Center(
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          size: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                )
                              ],
                            ),
                            Column(
                              children: List.generate(3, (index) {
                                return CartItem(
                                  cartItem: CartItemModel(
                                      productDetail: ProductDetailModel()),
                                );
                              }),
                            )
                          ],
                        )),
                  );
                },
              )),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Checkbox(value: false, onChanged: (value) {}),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Tổng cộng',
                      style: AppTypography.hintTextStyleBold,
                    ),
                    Text(
                      '${Format.formatNumber(100000)} vnđ',
                      style: AppTypography.largeDarkBlueBold,
                    ),
                  ],
                ),
                SizedBox(width: 10.w),
                CustomButton(
                  buttonColor: AppColors.buttonBlue,
                  buttonText: 'Mua hàng',
                  // disable: !state.carts.isSelected(),
                  onTap: () {},
                  textColor: AppColors.white,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
