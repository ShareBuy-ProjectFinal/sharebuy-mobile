import 'package:flutter/material.dart';
import 'package:source_tms/application/theme/app_colors.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments as Map?;
    switch (settings.name) {
      // case NavigatorNames.LOGIN_WEB:
      //   return MaterialPageRoute(
      //       builder: (_) => const LoginWeb(), fullscreenDialog: true);

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
