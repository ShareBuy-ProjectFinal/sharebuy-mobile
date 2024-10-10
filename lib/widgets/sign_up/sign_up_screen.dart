import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/theme/app_colors.dart';
import 'package:share_buy/application/theme/app_typography.dart';
import 'package:share_buy/utils/help_function.dart';
import 'package:share_buy/widgets/component/custom_button.dart';
import 'package:share_buy/widgets/component/custom_textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => HelpFunction.removeFocus(context),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 12.w,
            vertical: 12.h,
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 274.w,
                    height: 77.h,
                  ),
                  Text(
                    'Bắt đầu',
                    style: AppTypography.headerAppbarStyle,
                  ),
                  SizedBox(
                    height: 12.0.h,
                  ),
                  Text(
                    'Tạo một tài khoản mới',
                    style: AppTypography.hintTextStyle,
                  ),
                  SizedBox(
                    height: 12.0.h,
                  ),
                  CustomTextfield(
                      hintText: 'Tên đầy đủ',
                      iconUrl: 'assets/icons/icon_user.png',
                      controller: _emailController),
                  SizedBox(
                    height: 12.0.h,
                  ),
                  CustomTextfield(
                      hintText: 'Email',
                      iconUrl: 'assets/icons/icon_email.png',
                      controller: _passController),
                  SizedBox(
                    height: 12.0.h,
                  ),
                  CustomTextfield(
                      hintText: 'Mật khẩu',
                      iconUrl: 'assets/icons/icon_password.png',
                      controller: _passController),
                  SizedBox(
                    height: 12.0.h,
                  ),
                  CustomTextfield(
                      hintText: 'Nhập lại mật khẩu',
                      iconUrl: 'assets/icons/icon_password.png',
                      controller: _passController),
                  SizedBox(
                    height: 12.0.h,
                  ),
                  CustomButton(
                      buttonColor: AppColors.buttonBlue,
                      buttonText: 'Đăng kí',
                      onTap: () {},
                      textColor: AppColors.white),
                  SizedBox(
                    height: 12.0.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Có tài khoản ? ',
                        style: AppTypography.hintTextStyle,
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Đăng nhập',
                            style: AppTypography.primaryBlueBold,
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
