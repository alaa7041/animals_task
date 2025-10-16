import 'package:flutter/material.dart';

import '../theming/colors.dart';

void showSnackbar(BuildContext context, String message,
    {Color? color, bool isError = false}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color ?? (isError ? Colors.red : ColorsManager.primary),
      content: Text(
        message,
        style: const TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
