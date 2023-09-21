import 'package:flutter/material.dart';
import 'package:mvvm_practice/utils/routes/routes_name.dart';
import 'package:mvvm_practice/view_model/auth_viewmodel.dart';
import 'package:mvvm_practice/view_model/user_viewmodel.dart';
import 'package:mvvm_practice/view_model/users_list_viewmodel.dart';
import 'utils/routes/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AuthViewModel()),
      ChangeNotifierProvider(create: (_) => UserViewModel()),
      ChangeNotifierProvider(create: (_) => UsersListViewModel()),
    ],
    child: const MaterialApp(
      initialRoute: RouteName.splash,
      onGenerateRoute: Routes.generateRoute,
    ),
  ));
}
