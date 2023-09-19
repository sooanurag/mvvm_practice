import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_practice/view_model/auth_viewmodel.dart';

class SignInButton extends StatelessWidget {
  final String buttonTitle;
  final VoidCallback onPress;
  final bool loading;
  const SignInButton({
    super.key,
    required this.buttonTitle,
    required this.onPress,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton.filled(
      onPressed: onPress,
      child: (AuthViewModel.loading)
          ? const CircularProgressIndicator(
              color: Colors.white,
            )
          : Text(
              buttonTitle,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
    );
  }
}
