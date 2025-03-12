import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/config/routes.dart';
import 'package:todo_app/core/utils/supabase_helper.dart';
import 'package:todo_app/presentation/provider/auth_provider.dart';
import 'package:todo_app/presentation/provider/user_provider.dart';
import 'core/config/themes/dark_theme.dart';

void main() async {
  //Connect with supabase
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseHelper.initializeSupabase();
  runApp(
    ScreenUtilInit(
      designSize: Size(375, 812),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthProvider()),
          ChangeNotifierProvider(create: (_) => UserProvider()),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: DarkTheme,
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
