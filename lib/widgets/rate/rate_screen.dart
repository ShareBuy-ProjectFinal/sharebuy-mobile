import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/routes/navigator_name.dart';
import 'package:share_buy/application/theme/app_colors.dart';
import 'package:share_buy/application/theme/app_typography.dart';
import 'package:share_buy/models/comment.dart';
import 'package:share_buy/models/product_model.dart';
import 'package:share_buy/widgets/component/custom_button.dart';
import 'package:share_buy/widgets/rate/children/rate_comment.dart';
import 'package:share_buy/widgets/rate/children/star_button.dart';

class RateScreen extends StatefulWidget {
  const RateScreen({super.key});

  @override
  State<RateScreen> createState() => _RateScreenState();
}

class _RateScreenState extends State<RateScreen> {
  final List<Comment> comments = [
    Comment(
      avatarUrl: '',
      name: '',
      comment: '',
      productModel: ProductTestModel(
          name: 'Giày',
          imageUrl: 'assets/images/shose_1.png',
          price: 299.43,
          salePrice: 534.33,
          saleOffPercent: 24),
      imageUrls: [
        'assets/images/shose_1.png',
        'assets/images/shose_1.png',
        'assets/images/shose_1.png',
        'assets/images/shose_1.png'
      ],
    ),
    Comment(
      avatarUrl: '',
      name: '',
      comment: '',
      productModel: ProductTestModel(
          name: 'Giày',
          imageUrl: 'assets/images/shose_1.png',
          price: 299.43,
          salePrice: 534.33,
          saleOffPercent: 24),
      imageUrls: [
        'assets/images/shose_1.png',
        'assets/images/shose_1.png',
        'assets/images/shose_1.png',
        'assets/images/shose_1.png'
      ],
    ),
    Comment(
      avatarUrl: '',
      name: '',
      comment: '',
      productModel: ProductTestModel(
          name: 'Giày',
          imageUrl: 'assets/images/shose_1.png',
          price: 299.43,
          salePrice: 534.33,
          saleOffPercent: 24),
      imageUrls: [
        'assets/images/shose_1.png',
        'assets/images/shose_1.png',
        'assets/images/shose_1.png',
        'assets/images/shose_1.png'
      ],
    ),
    Comment(
      avatarUrl: '',
      name: '',
      comment: '',
      productModel: ProductTestModel(
          name: 'Giày',
          imageUrl: 'assets/images/shose_1.png',
          price: 299.43,
          salePrice: 534.33,
          saleOffPercent: 24),
      imageUrls: [
        'assets/images/shose_1.png',
        'assets/images/shose_1.png',
        'assets/images/shose_1.png',
        'assets/images/shose_1.png'
      ],
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Image.asset(
            'assets/icons/icon_back.png',
            width: 24.w,
            height: 24.h,
          ),
        ),
        title: Text(
          '5 đánh giá',
          style: AppTypography.headerAppbarStyle,
        ),
        centerTitle: false,
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
        child: Column(
          children: [
            StarButton(),
            SizedBox(height: 12.h),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return RateComment(comment: comments[index]);
                },
                itemCount: comments.length,
              ),
            ),
            CustomButton(
                buttonColor: AppColors.buttonBlue,
                buttonText: 'Viết đánh giá',
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(NavigatorName.RATE_COMMENT_FORM_SCREEN);
                },
                textColor: AppColors.white)
          ],
        ),
      )),
    );
  }
}
