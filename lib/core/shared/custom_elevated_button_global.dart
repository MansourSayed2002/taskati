import 'package:flutter/material.dart';
import 'package:taskati/core/theme/color_app.dart';
import 'package:taskati/core/theme/textstyle_app.dart';

class CustomElevatedButtonGlobal extends StatelessWidget {
  const CustomElevatedButtonGlobal({
    super.key,
    required this.title,
    required this.onPressed,
    this.colorButton,
    this.textstyle,
    this.width,
  });
  final String title;
  final Function() onPressed;
  final Color? colorButton;
  final TextStyle? textstyle;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: 45.0,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: colorButton ?? ColorApp.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Text(
          title,
          style: textstyle ?? getBodyTextStyle(color: ColorApp.white),
        ),
      ),
    );
  }
}
