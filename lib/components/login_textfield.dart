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
        fillColor: Theme.of(context).colorScheme.secondary,
        filled: true,
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.surface,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.surface,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
