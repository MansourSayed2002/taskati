import 'package:flutter/material.dart';
import 'package:taskati/core/theme/color_app.dart';
import 'package:taskati/core/theme/textstyle_app.dart';

class CustomFormFieldGlobal extends StatelessWidget {
  const CustomFormFieldGlobal({
    super.key,
    this.hintText,
    this.controller,
    this.maxlength,
    this.contentPadding,
    this.suffixIcon,
    this.readOnly,
  });
  final String? hintText;
  final int? maxlength;
  final TextEditingController? controller;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? suffixIcon;
  final bool? readOnly;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLength: maxlength,
      readOnly: readOnly ?? false,
      style: getBodyTextStyle(color: ColorApp.white),
      decoration: InputDecoration(
        contentPadding: contentPadding,
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
