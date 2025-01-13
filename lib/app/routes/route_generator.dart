import 'package:auth_app/app/modules/splash/splash.dart';
import 'package:auth_app/app/modules/splash/splash_state.dart';
import 'package:flutter/material.dart';

import '../modules/auth/login/login_screen.dart';
import '../modules/auth/signup/signup_screen.dart';
import '../modules/dashboard/home_screen.dart';
import 'constant.dart';

class RouteGenerator {
  static Route<dynamic> generatorRoute(RouteSettings settings) {
    final arg = settings.name;
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case Routes.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case Routes.signup:
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Error Route')),
        ),
        body: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text('The error occur in Route',
                    style: TextStyle(color: Colors.red, fontSize: 30))),
          ],
        ),
      );
    });
  }
}
