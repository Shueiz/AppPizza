import 'package:flutter/material.dart';

class LoginController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool validateLogin() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    return email.isNotEmpty && password.isNotEmpty;
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
