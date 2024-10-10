import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/routes/navigator_name.dart';
import 'package:share_buy/application/theme/app_colors.dart';
import 'package:share_buy/application/theme/app_typography.dart';
import 'package:share_buy/utils/help_function.dart';
import 'package:share_buy/widgets/component/custom_button.dart';
import 'package:share_buy/widgets/component/custom_textfield.dart';
import 'package:share_buy/widgets/login/children/button_login_social.dart';
import 'package:text_divider/text_divider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                    'Chào mừng đến với Sharebuy',
                    style: AppTypography.headerAppbarStyle,
                  ),
                  SizedBox(
                    height: 12.0.h,
                  ),
                  Text(
                    'Đăng nhập để tiếp tục',
                    style: AppTypography.hintTextStyle,
                  ),
                  SizedBox(
                    height: 12.0.h,
                  ),
                  CustomTextfield(
                      hintText: 'Email của bạn',
                      iconUrl: 'assets/icons/icon_email.png',
                      controller: _emailController),
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
                  CustomButton(
                      buttonColor: AppColors.buttonBlue,
                      buttonText: 'Đăng nhập',
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(NavigatorName.HOME_SCREEN);
                      },
                      textColor: AppColors.white),
                  SizedBox(
                    height: 12.0.h,
                  ),
                  TextDivider.horizontal(
                    text: Text(
                      'HOẶC',
                      style: AppTypography.hintTextStyleBold,
                    ),
                    color: AppColors.hintTextColor,
                  ),
                  SizedBox(
                    height: 12.0.h,
                  ),
                  ButtonLoginSocial(
                    onTap: () {},
                    buttonText: 'Đăng nhập với Google',
                    iconUrl: 'assets/icons/icon_gmail.png',
                  ),
                  SizedBox(
                    height: 12.0.h,
                  ),
                  ButtonLoginSocial(
                    onTap: () {},
                    buttonText: 'Đăng nhập với Facebook',
                    iconUrl: 'assets/icons/icon_facebook.png',
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Quên mật khẩu',
                        style: AppTypography.primaryBlueBold,
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Không có tài khoản ? ',
                        style: AppTypography.hintTextStyle,
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(NavigatorName.SIGN_UP_SCREEN);
                          },
                          child: Text(
                            'Đăng kí',
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
