import 'package:flutter/material.dart';
import 'package:mvvm_practice/utils/routes/routes_name.dart';
import 'package:mvvm_practice/view_model/user_viewmodel.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
              onPressed: () {
                userProvider.removeUser();
                Navigator.of(context).popUntil((route) => route.isFirst);
                Navigator.pushReplacementNamed(context, RouteName.login);
              },
              icon: const Icon(Icons.logout_outlined))
        ],
      ),
    );
  }
}
