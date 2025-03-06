import 'package:flutter/material.dart';
import 'package:taskati/core/theme/color_app.dart';
import 'package:taskati/core/theme/textstyle_app.dart';

extension MessageBar on BuildContext {
  messageBar(String message, [Color? color]) {
    return ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        backgroundColor: color ?? ColorApp.red,
        content: Text(
          message,
          style: getBodyTextStyle(this, color: ColorApp.white),
        ),
      ),
    );
  }
}
