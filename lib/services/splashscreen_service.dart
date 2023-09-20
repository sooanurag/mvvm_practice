import 'package:flutter/material.dart';
import 'package:mvvm_practice/utils/routes/routes_name.dart';
import 'package:mvvm_practice/view_model/user_viewmodel.dart';

import '../utils/utils.dart';

class SplashScreenService {
  void checkAuthentication(BuildContext context) async {
    final asyncNav = Navigator.of(context);
    final value = await UserViewModel().getUser().onError((error, stackTrace) {
      Navigator.of(context).popUntil((route) => route.isFirst);
      Navigator.pushReplacementNamed(context, RouteName.login);
      Utils.flushBarErrorMessage(context, error.toString());
    });

    if (value != null) {
      await Future.delayed(const Duration(seconds: 2));
      asyncNav.popUntil((route) => route.isFirst);
      asyncNav.pushReplacementNamed(RouteName.home);
    } else {
      await Future.delayed(const Duration(seconds: 2));
      asyncNav.popUntil((route) => route.isFirst);
      asyncNav.pushReplacementNamed(RouteName.login);
    }
  }
}
