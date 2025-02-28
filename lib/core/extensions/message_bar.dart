import 'package:flutter/material.dart';
import 'package:taskati/core/theme/color_app.dart';
import 'package:taskati/core/theme/textstyle_app.dart';

extension MessageBar on BuildContext {
  messageBar(String message) {
    return ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        backgroundColor: ColorApp.red,
        content: Text(message, style: getBodyTextStyle(color: ColorApp.white)),
      ),
    );
  }
}
