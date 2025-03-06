import 'package:flutter/material.dart';
import 'package:taskati/core/theme/color_app.dart';
import 'package:taskati/core/theme/textstyle_app.dart';

class CustomFormFieldGlobal extends StatelessWidget {
  const CustomFormFieldGlobal({
    super.key,
    this.hintText,
    this.controller,
    this.maxLines,
    this.suffixIcon,
    this.readOnly,
    this.onTap,
    this.style,
  });
  final String? hintText;
  final int? maxLines;
  final TextEditingController? controller;
  final Function()? onTap;
  final Widget? suffixIcon;
  final bool? readOnly;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      readOnly: readOnly ?? false,
      onTap: onTap,
      style: style ?? getBodyTextStyle(context),
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
        hintStyle: getSmallTextStyle(),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(color: ColorApp.primary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(color: ColorApp.primary),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(color: ColorApp.red),
        ),
      ),
    );
  }
}
