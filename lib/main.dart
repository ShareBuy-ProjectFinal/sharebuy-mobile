import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:source_tms/application/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [],
      child: ScreenUtilInit(
        designSize: const Size(381, 732),
        builder: (_, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: appTheme,
            home: child,
          );
        },
        child: const Scaffold(
          body: Center(
            child: Text('Loc'),
          ),
        ),
      ),
    );
  }
}
