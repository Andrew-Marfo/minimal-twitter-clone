import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function()? onTap;
  const CustomButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 60,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: const Center(
          child: Text(
            'Login',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              letterSpacing: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
