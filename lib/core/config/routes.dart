import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todo_app/presentation/screens/auth/register_screen.dart';
import 'package:todo_app/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:todo_app/presentation/screens/splash/splash_screen.dart';
import '../../presentation/screens/auth/login_screen.dart';
import '../../presentation/screens/task/task_edit_screen.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String register = '/register';
  static const String taskedit = '/taskedit';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return PageTransition(
          type: PageTransitionType.fade,
          child: SplashScreen(),
        );
      case onboarding:
        return PageTransition(
          type: PageTransitionType.fade,
          child: OnboardingScreen(),
        );
      case login:
        return PageTransition(
          duration: 700.ms,
          type: PageTransitionType.fade,
          child: LoginScreen(),
        );
      case register:
        return PageTransition(
          duration: 700.ms,
          type: PageTransitionType.fade,
          child: RegisterScreen(),
        );
      case taskedit:
        return PageTransition(
          type: PageTransitionType.fade,
          child: TaskEditScreen(),
        );
      default:
        return null;
    }
  }
}
