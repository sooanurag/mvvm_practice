import 'package:flutter/material.dart';
import 'package:mvvm_practice/utils/routes/routes_name.dart';
import 'package:mvvm_practice/view_model/user_viewmodel.dart';

import '../utils/utils.dart';


class SplashScreenService {
  void checkAuthentication(BuildContext context) async {
    await UserViewModel().getUser().then((value) async {
      if (value != null) {
        await Future.delayed(const Duration(seconds: 2));
        Navigator.of(context).popUntil((route) => route.isFirst);
        Navigator.pushReplacementNamed(context, RouteName.home);
      } else {
        await Future.delayed(const Duration(seconds: 2));
        Navigator.of(context).popUntil((route) => route.isFirst);
        Navigator.pushReplacementNamed(context, RouteName.login);
      }
    }).onError((error, stackTrace) {
      Navigator.of(context).popUntil((route) => route.isFirst);
      Navigator.pushReplacementNamed(context, RouteName.login);
      Utils.flushBarErrorMessage(context, error.toString());
    });
  }
}
