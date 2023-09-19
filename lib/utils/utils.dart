import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:another_flushbar/flushbar.dart';

class Utils {
  static showToastMessage(String message) {
    Fluttertoast.showToast(msg: message);
  }

  static void flushBarErrorMessage(BuildContext context, String message) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        duration: const Duration(seconds: 5),
        backgroundColor: Colors.blueAccent,
        borderRadius: BorderRadius.circular(20),
        dismissDirection: FlushbarDismissDirection.HORIZONTAL,
        flushbarPosition: FlushbarPosition.BOTTOM,
        isDismissible: true,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        icon: const Icon(Icons.error),
        message: message,
        title: "Message:",
      )..show(context),
    );
  }

  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  static TextFormField customTextFormField({
    required TextEditingController inputController,
    required String invalidText,
    required String label,
    String? hint,
    required IconData prefixIcon,
    FocusNode? currentFocusNode,
    BuildContext? context,
    FocusNode? nextNode,
    bool obscure = false,
    Widget? suffixIcon,
  }) {
    return TextFormField(
      controller: inputController,
      obscureText: obscure,
      focusNode: currentFocusNode,
      onFieldSubmitted: (context != null)
          ? (value) => changeFieldFocus(
              context: context,
              currentNode: currentFocusNode!,
              nextNode: nextNode!)
          : null,
      validator: (value) {
        if (value!.isEmpty) {
          return invalidText;
        }
        return null;
      },
      decoration: InputDecoration(
        label: Text(label),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        hintText: hint,
        prefixIcon: Icon(prefixIcon),
        suffixIcon: suffixIcon,
      ),
    );
  }

  static void changeFieldFocus({
    required BuildContext context,
    required FocusNode currentNode,
    required FocusNode nextNode,
  }) {
    currentNode.unfocus();
    FocusScope.of(context).requestFocus(nextNode);
  }
}
