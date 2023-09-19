import 'package:flutter/foundation.dart';
import 'package:mvvm_practice/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier {
  Future<bool> saveUser(UserModel user) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setString("token", user.token.toString());
    notifyListeners();
    return true;
  }

  Future<dynamic> getUser() async {
    final prefrences = await SharedPreferences.getInstance();
    String? userData = prefrences.getString("token");
    return (userData != null) ? UserModel(token: userData) : null;
  }

  Future<bool> removeUser() async {
    final prefrences = await SharedPreferences.getInstance();
    return prefrences.remove("token");
  }
}
