import 'package:flutter/material.dart';

void showLoadingSpinner(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return const AlertDialog(
        backgroundColor: Colors.transparent,
        content: Center(
          child: CircularProgressIndicator(),
        ),
      );
    },
  );
}

void hideLoadingSpinner(BuildContext context) {
  Navigator.of(context).pop();
}
