// class to have a route generator method

import 'package:flutter/material.dart';
import 'package:mvvm_practice/view/home_screen.dart';
import 'package:mvvm_practice/view/login_screen.dart';
import 'package:mvvm_practice/view/signup_screen.dart';
import 'package:mvvm_practice/view/splash_screen.dart';
import 'routes_name.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case RouteName.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case RouteName.signup:
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
      case RouteName.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                  appBar: AppBar(title: const Text("Null")),
                  body: const Center(
                    child: Text("No route defined!"),
                  ),
                ));
    }
  }
}
