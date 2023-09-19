import 'package:flutter/material.dart';
import 'package:mvvm_practice/services/splashscreen_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final splashScreenService = SplashScreenService();
  @override
  void initState() {
    super.initState();
    splashScreenService.checkAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Splash Screen"),
      ),
    );
  }
}
