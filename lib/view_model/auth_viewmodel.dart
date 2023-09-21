// put underlying data which may change over-time.
// class encap all providers authentication.

import 'package:flutter/material.dart';
import 'package:mvvm_practice/model/user_model.dart';
import 'package:mvvm_practice/repo/auth_repo.dart';
import 'package:mvvm_practice/utils/routes/routes_name.dart';
import 'package:mvvm_practice/view_model/user_viewmodel.dart';

import '../utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

  static bool _loading = false;
  static bool get loading => _loading;
  void setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  Future<void> loginApi(BuildContext context, dynamic data) async {
    setLoading(true);
    _myRepo.loginApi(data).then((value) async {
      
      setLoading(false);
      bool? isSaved;
      flushBarCall(bool issaved) {
        Utils.flushBarErrorMessage(context,
            "Login Seccess: ${value.toString()}\t Saved: ${issaved.toString()}");
      }

      Navigator.of(context).popUntil((route) => route.isFirst);
      Navigator.pushReplacementNamed(context, RouteName.home);
      isSaved = await UserViewModel().saveUser(UserModel.fromJson(value));
      flushBarCall(isSaved);
      
    }).onError((error, stackTrace) {
      Utils.flushBarErrorMessage(context, error.toString());
    });
  }

  Future<void> signUpApi(BuildContext context, dynamic data) async {
    setLoading(true);
    _myRepo.signUpApi(data).then((value) async {

      setLoading(false);
      final asyncNavigator = Navigator.of(context);
      flushBarCall(bool issaved) {
        Utils.flushBarErrorMessage(
            context, "Sign Up Seccess: ${value.toString()} \t Saved: $issaved");
      }

      bool isSaved = await UserViewModel().saveUser(UserModel.fromJson(value));

      asyncNavigator.popUntil((route) => route.isFirst);
      asyncNavigator.pushReplacementNamed(RouteName.home);
      flushBarCall(isSaved);
    }).onError((error, stackTrace) {
      Utils.flushBarErrorMessage(context, error.toString());
    });
  }
}
