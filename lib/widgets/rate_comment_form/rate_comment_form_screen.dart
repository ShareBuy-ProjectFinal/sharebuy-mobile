import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:share_buy/application/theme/app_colors.dart';
import 'package:share_buy/application/theme/app_typography.dart';
import 'package:share_buy/blocs/product_bloc/product_bloc.dart';
import 'package:share_buy/blocs/product_bloc/product_event.dart';
import 'package:share_buy/blocs/review_bloc/review_bloc.dart';
import 'package:share_buy/blocs/review_bloc/review_event.dart';
import 'package:share_buy/blocs/review_bloc/review_state.dart';
import 'package:share_buy/main.dart';
import 'package:share_buy/utils/help_function.dart';
import 'package:share_buy/widgets/component/custom_button.dart';
import 'package:share_buy/widgets/component/custom_textfield.dart';
import 'package:share_buy/widgets/component/snack_bar.dart';

class RateCommentFormScreen extends StatefulWidget {
  const RateCommentFormScreen({super.key});

  @override
  State<RateCommentFormScreen> createState() => _RateCommentFormScreenState();
}

class _RateCommentFormScreenState extends State<RateCommentFormScreen> {
  final TextEditingController _reviewController = TextEditingController();

  final List<File> _images = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  _selectedImage() async {
    XFile? img = await HelpFunction.pickImage(ImageSource.gallery);
    if (img != null) {
      setState(() {
        _images.add(File(img.path));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReviewBloc, ReviewState>(
      listener: (BuildContext context, ReviewState state) {
        if (state.isLoading) {
          context.loaderOverlay.show();
        } else {
          context.loaderOverlay.hide();
          if (state.isAddSuccess) {
            context.read<ProductBloc>().add(EventLoadingReviewProduct());
            Navigator.of(context).pop();
          }
        }
      },
      child: Scaffold(
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
            'Viết đánh giá',
            style: AppTypography.headerAppbarStyle,
          ),
          centerTitle: false,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
            child:
                BlocBuilder<ReviewBloc, ReviewState>(builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Vui lòng viết mức độ hài lòng chung với Dịch vụ vận chuyển / giao hàng của bạn',
                        style: AppTypography.primaryDarkBlueBold,
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Row(
                        children: [
                          AnimatedRatingStars(
                            initialRating: 0,
                            filledColor: Colors.amber,
                            emptyColor: Colors.grey,
                            filledIcon: Icons.star,
                            halfFilledIcon: Icons.star_half,
                            emptyIcon: Icons.star_border,
                            onChanged: (double rating) {
                              context
                                  .read<ReviewBloc>()
                                  .add(EventSelectRating(rating));
                            },
                            displayRatingValue: true,
                            interactiveTooltips: true,
                            customFilledIcon: Icons.star,
                            customHalfFilledIcon: Icons.star_half,
                            customEmptyIcon: Icons.star_border,
                            starSize: 32.sp,
                            // readOnly: true,
                          ),
                          SizedBox(
                            width: 12.0.w,
                          ),
                          Text(
                            '${(state.review?.rating ?? 0).toStringAsFixed(0)}/5',
                            style: AppTypography.primaryDarkBlueBold,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Text('Viết đánh giá của bạn',
                          style: AppTypography.primaryDarkBlueBold),
                      SizedBox(
                        height: 12.h,
                      ),
                      CustomTextfield(
                          hintText: 'Viết tại đây',
                          maxLines: 5,
                          controller: _reviewController),
                      SizedBox(
                        height: 12.h,
                      ),
                      Text('Thêm hình ảnh',
                          style: AppTypography.primaryDarkBlueBold),
                      SizedBox(
                        height: 12.h,
                      ),
                      Wrap(
                        spacing: 10.w,
                        runSpacing: 10.h,
                        children: List.generate(
                            _images.length < 5
                                ? _images.length + 1
                                : _images.length, (index) {
                          return index == _images.length
                              ? GestureDetector(
                                  onTap: _selectedImage,
                                  child: Container(
                                    width: 72.w,
                                    height: 72.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.r),
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                          color:
                                              AppColors.borderTextfieldColor),
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      color: AppColors.hintTextColor,
                                      size: 30.sp,
                                    ),
                                  ),
                                )
                              : Stack(
                                  children: [
                                    Container(
                                      width: 72.w,
                                      height: 72.h,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.r),
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                            color:
                                                AppColors.borderTextfieldColor),
                                      ),
                                      // child:
                                      // Image.memory(
                                      //   _images[index],
                                      //   fit: BoxFit.cover,
                                      // ),
                                      child: Image.file(
                                        _images[index],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                        right: 0,
                                        child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                _images.removeAt(index);
                                              });
                                            },
                                            icon: const Icon(
                                              Icons.delete_outline_rounded,
                                              color: AppColors.white,
                                            )))
                                  ],
                                );
                        }),
                      )
                    ],
                  ),
                  CustomButton(
                    buttonColor: AppColors.buttonBlue,
                    buttonText: 'Gửi đánh giá',
                    onTap: () {
                      if (state.review?.rating == null ||
                          state.review?.rating == 0) {
                        MessageToast.showToast(
                            context, "Vui lòng chọn đánh giá sao");
                        return;
                      }
                      if (_reviewController.text.isEmpty) {
                        MessageToast.showToast(
                            context, "Vui lòng nhập nội dung đánh giá");
                        return;
                      }
                      context
                          .read<ReviewBloc>()
                          .add(EvendAddReview(_reviewController.text, _images));
                    },
                    textColor: AppColors.white,
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
