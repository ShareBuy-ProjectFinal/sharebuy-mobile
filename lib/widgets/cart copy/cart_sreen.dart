import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/routes/navigator_name.dart';
import 'package:share_buy/application/theme/app_colors.dart';
import 'package:share_buy/application/theme/app_typography.dart';
import 'package:share_buy/widgets/cart/children/cart_item.dart';
import 'package:share_buy/widgets/component/custom_button.dart';

class CartSreen extends StatefulWidget {
  const CartSreen({super.key});

  @override
  State<CartSreen> createState() => _CartSreenState();
}

class _CartSreenState extends State<CartSreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(
          'Giỏ hàng',
          style: AppTypography.headerAppbarStyle,
        ),
        centerTitle: false,
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 0.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Giaynamshop',
                  style: AppTypography.primaryDarkBlueBold,
                ),
                IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/icons/icon_remove.png',
                      width: 24.w,
                      height: 24.h,
                    )),
              ],
            ),
            SizedBox(
              height: 210.h,
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const CartItem();
                },
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              // height: 120.h,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lê Hữu Hiệp',
                    style: AppTypography.headerAppbarStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Địa chỉ: 123, Phường 1',
                        style: AppTypography.primaryDarkBlueBold,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/icons/icon_remove.png',
                            width: 24.w,
                            height: 24.h,
                          )),
                    ],
                  ),
                  Text(
                    '+84 123 456 789',
                    style: AppTypography.primaryDarkBlueBold,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sản phẩm (2)',
                        style: AppTypography.primaryDarkBlueBold,
                      ),
                      Text(
                        '10.000 vnđ',
                        style: AppTypography.primaryDarkBlueBold,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Phí vận chuyển',
                        style: AppTypography.primaryDarkBlueBold,
                      ),
                      Text(
                        '10.000 vnđ',
                        style: AppTypography.primaryDarkBlueBold,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Giảm giá',
                        style: AppTypography.primaryDarkBlueBold,
                      ),
                      Text(
                        '10.000 vnđ',
                        style: AppTypography.primaryDarkBlueBold,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  const Divider(
                    color: Colors.grey,
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tổng',
                        style: AppTypography.primaryDarkBlueBold,
                      ),
                      Text(
                        '30.000 vnđ',
                        style: AppTypography.primaryDarkBlueBold,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomButton(
                buttonColor: AppColors.buttonBlue,
                buttonText: 'Thanh toán',
                onTap: () {
                  Navigator.of(context).pushNamed(NavigatorName.HOME_SCREEN);
                },
                textColor: AppColors.white),
          ],
        ),
      )),
    );
  }
}
