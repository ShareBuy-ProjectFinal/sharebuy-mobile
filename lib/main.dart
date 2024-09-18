import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:source_tms/application/theme/app_colors.dart';
import 'package:source_tms/application/theme/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(381, 732),
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: appTheme,
          home: child,
        );
      },
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(color: AppColors.primary),
          child: const Center(
            child: Text('Loc'),
          ),
        ),
      ),
    );
  }
}
