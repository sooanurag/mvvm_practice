import 'package:flutter/material.dart';
import 'package:mvvm_practice/services/splashscreen_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final splashScreenService = SplashScreenService();
  // @override
  // void initState() {
  //   super.initState();
  //   // Builder(builder: (innerContext) {
  //   //   splashScreenService.checkAuthentication(innerContext);
  //   //   return const CircularProgressIndicator();
  //   // });
  //   // splashScreenService.checkAuthentication(context);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Builder(builder: (innerContext) {
          splashScreenService.checkAuthentication(innerContext);
          return const Text("Splash Screen");
        }),
      ),
    );
  }
}
