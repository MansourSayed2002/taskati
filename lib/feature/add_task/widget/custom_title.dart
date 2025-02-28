import 'package:flutter/material.dart';
import 'package:taskati/core/constants/text_app.dart';
import 'package:taskati/core/shared/custom_form_field_global.dart';
import 'package:taskati/core/theme/textstyle_app.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(TextApp.title, style: getTitleTextStyle()),
        SizedBox(height: 5.0),
        CustomFormFieldGlobal(hintText: TextApp.entertitle),
      ],
    );
  }
}
