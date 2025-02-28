import 'package:flutter/material.dart';
import 'package:taskati/core/theme/color_app.dart';

TextStyle getTitleTextStyle({
  double? fontSize,
  Color? color,
  FontWeight? fontWeight,
}) {
  return TextStyle(
    fontFamily: "Poppins",
    fontSize: fontSize ?? 18,
    color: color ?? ColorApp.dark,
    fontWeight: fontWeight ?? FontWeight.bold,
  );
}

TextStyle getBodyTextStyle({
  double? fontSize,
  Color? color,
  FontWeight? fontWeight,
}) {
  return TextStyle(
    fontFamily: "Poppins",
    fontSize: fontSize ?? 16,
    color: color ?? ColorApp.dark,
    fontWeight: fontWeight ?? FontWeight.normal,
  );
}

TextStyle getSmallTextStyle({
  double? fontSize,
  Color? color,
  FontWeight? fontWeight,
}) {
  return TextStyle(
    fontFamily: "Poppins",
    fontSize: fontSize ?? 14,
    color: color ?? ColorApp.grey,
    fontWeight: fontWeight ?? FontWeight.normal,
  );
}
