import 'package:flutter/material.dart';

void showCustomSnackBar({required BuildContext buildContext, required String text, Color? color, int? durationMs}) {
  final snackBar = SnackBar(
    content: Text(text),
    backgroundColor: color,
    duration: Duration(milliseconds: durationMs ?? 1200),
    behavior: SnackBarBehavior.floating,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
  );
  ScaffoldMessenger.of(buildContext).showSnackBar(snackBar);
}
