import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:share_buy/application/routes/navigator_name.dart';
import 'package:share_buy/application/theme/app_colors.dart';
import 'package:share_buy/application/theme/app_typography.dart';
import 'package:share_buy/blocs/auth_bloc/auth_bloc.dart';
import 'package:share_buy/blocs/auth_bloc/auth_event.dart';
import 'package:share_buy/blocs/auth_bloc/auth_state.dart';
import 'package:share_buy/utils/help_function.dart';
import 'package:share_buy/widgets/component/custom_button.dart';
import 'package:share_buy/widgets/component/custom_textfield.dart';
import 'package:share_buy/widgets/component/snack_bar.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _cfPassController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    _nameController.dispose();
    _cfPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.isLoading) {
          context.loaderOverlay.show();
        } else {
          context.loaderOverlay.hide();
        }
        if (state.isSuccess) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              NavigatorName.HOME_SCREEN, (route) => false);
          state.isSuccess = false;
        }
        // else {
        //   MessageToast.showToast(
        //       context, 'Lỗi xảy ra khi đăng kí tài khoản, thử lại.');
        // }
      },
      child: GestureDetector(
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
                        controller: _nameController),
                    SizedBox(
                      height: 12.0.h,
                    ),
                    CustomTextfield(
                        hintText: 'Email',
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
                    CustomTextfield(
                        hintText: 'Nhập lại mật khẩu',
                        iconUrl: 'assets/icons/icon_password.png',
                        controller: _cfPassController),
                    SizedBox(
                      height: 12.0.h,
                    ),
                    CustomButton(
                        buttonColor: AppColors.buttonBlue,
                        buttonText: 'Đăng kí',
                        onTap: () {
                          context.read<AuthBloc>().add(EventCreateUser(
                              email: _emailController.text,
                              password: _passController.text,
                              fullName: _nameController.text));
                        },
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
                              style: AppTypography.mediumBlueBold,
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
