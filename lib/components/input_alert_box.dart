import 'package:flutter/material.dart';

class InputAlertBox extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final void Function()? onPressed;
  final String onPressedText;
  const InputAlertBox({
    super.key,
    required this.textController,
    required this.hintText,
    this.onPressed,
    required this.onPressedText,
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
