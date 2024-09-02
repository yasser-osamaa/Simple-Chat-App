import 'package:flutter/material.dart';

void showSnackBar(context, String message, [Color? backgroundColor]) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor,
    ),
  );
}
