import 'package:flutter/material.dart';
import 'package:twitter_clone/pages/login_page.dart';
import 'package:twitter_clone/pages/register_page.dart';

class RegisterLogin extends StatefulWidget {
  const RegisterLogin({super.key});

  @override
  State<RegisterLogin> createState() => _RegisterLoginState();
}

class _RegisterLoginState extends State<RegisterLogin> {
  bool isLogin = true;

  void toggleAuthPages() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLogin) {
      return LoginPage(
        onTap: toggleAuthPages,
      );
    } else {
      return RegisterPage(
        onTap: toggleAuthPages,
      );
    }
  }
}
