import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/presentation/widgets/bottomNagationBar_widget.dart';
import 'package:todo_app/test.dart';
import 'core/config/routes.dart';
import 'core/config/themes/dark_theme.dart';

void main() {
  runApp(
    ScreenUtilInit(
      designSize: Size(375, 812),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: DarkTheme,
      // initialRoute: AppRoutes.login,
      // onGenerateRoute: AppRoutes.onGenerateRoute,
      home: BottomNavigatoinBar(),
    );
  }
}
