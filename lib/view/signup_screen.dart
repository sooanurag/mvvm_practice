import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../res/components/signin_button.dart';
import '../utils/utils.dart';
import '../view_model/auth_viewmodel.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
        title: const Text("Sign Up"),
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
                      buttonTitle: "Sign Up",
                      onPress: () {
                        if (formKey.currentState!.validate()) {
                          dynamic data = {
                            'email': _emailcontroller.text.toString(),
                            'password': _passwordController.text.toString(),
                          };
                          authProvider.signUpApi(context, data);
                        } else {
                          Utils.flushBarErrorMessage(
                              context, "Enter fileds correctly!");
                        }
                      },
                    ),
                  ],
                ),
              ))),
    );
  }
}
