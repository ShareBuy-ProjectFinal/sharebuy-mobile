import 'package:flutter/material.dart';
import 'package:share_buy/application/routes/navigator_name.dart';
import 'package:share_buy/application/theme/app_colors.dart';
import 'package:share_buy/widgets/home/home_screen.dart';
import 'package:share_buy/widgets/sign_up/sign_up_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments as Map?;
    switch (settings.name) {
      case NavigatorName.SIGN_UP_SCREEN:
        return MaterialPageRoute(
          builder: (_) => const SignUpScreen(),
        );
      case NavigatorName.HOME_SCREEN:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            backgroundColor: AppColors.primary,
            body: Container(
              color: Colors.amber,
              child: Center(
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(_),
                  child: const Text("Quay trở lại"),
                ),
              ),
            ),
          ),
        );
    }
  }
}
