import 'package:flutter/material.dart';
import 'package:musicsl/Login/LoginScreen.dart';
import 'package:musicsl/Signup/SignupScreen.dart';

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
//initially show login page
  bool showLoginScreen = true;

  //toogle between login and register
  void togglePage() {
    setState(() {
      showLoginScreen = !showLoginScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginScreen) {
      return LoginScreen();
    } else {
      return SignUpScreen();
    }
  }
}
