import 'package:flutter/material.dart';
import 'package:mvvm_practice/res/components/signin_button.dart';
import 'package:mvvm_practice/utils/routes/routes_name.dart';
import 'package:mvvm_practice/view_model/auth_viewmodel.dart';
import 'package:provider/provider.dart';

import '../utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final _emailcontroller = TextEditingController();
  final _passwordController = TextEditingController();
  final emailFocusnode = FocusNode();
  final passwordFocusNode = FocusNode();

  final ValueNotifier<bool> _obscureText = ValueNotifier<bool>(true);

  @override
  void dispose() {
    super.dispose();
    _emailcontroller.dispose();
    _obscureText.dispose();
    _passwordController.dispose();
    emailFocusnode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: SafeArea(
          child: Form(
              key: formKey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Utils.customTextFormField(
                      inputController: _emailcontroller,
                      invalidText: "Enter Email address!",
                      label: "Email Address",
                      prefixIcon: Icons.email_outlined,
                      currentFocusNode: emailFocusnode,
                      nextNode: passwordFocusNode,
                      context: context,
                    ),
                    const Divider(),
                    ValueListenableBuilder(
                        valueListenable: _obscureText,
                        builder: (context, value, child) {
                          return Utils.customTextFormField(
                            inputController: _passwordController,
                            invalidText: "Enter Password!",
                            label: "Password",
                            prefixIcon: Icons.lock_open_outlined,
                            currentFocusNode: passwordFocusNode,
                            obscure: _obscureText.value,
                            suffixIcon: IconButton(
                                icon: (_obscureText.value == true)
                                    ? const Icon(Icons.visibility_off_outlined)
                                    : const Icon(
                                        Icons.visibility_outlined,
                                        color: Colors.blue,
                                      ),
                                onPressed: () {
                                  _obscureText.value = !_obscureText.value;
                                }),
                          );
                        }),
                    const Divider(),
                    SignInButton(
                      buttonTitle: "Log in",
                      onPress: () {
                        if (formKey.currentState!.validate()) {
                          dynamic data = {
                            'email': _emailcontroller.text.toString(),
                            'password': _passwordController.text.toString(),
                          };
                          authProvider.loginApi(context, data);
                        } else {
                          Utils.flushBarErrorMessage(
                              context, "Enter fileds correctly!");
                        }
                      },
                    ),
                  ],
                ),
              ))),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Don't have an account?"),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, RouteName.signup);
                },
                child: const Text(
                  "Sign Up",
                  style: TextStyle(color: Colors.blue),
                ))
          ],
        ),
      ),
    );
  }
}
