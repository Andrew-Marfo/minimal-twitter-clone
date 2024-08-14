import 'package:flutter/material.dart';

class LoginTextfield extends StatelessWidget {
  final String hintText;
  final TextEditingController textController;
  final bool obscure;

  const LoginTextfield({
    super.key,
    required this.hintText,
    required this.textController,
    required this.obscure,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscure,
      controller: textController,
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }
}
