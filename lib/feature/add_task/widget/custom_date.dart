import 'package:flutter/material.dart';
import 'package:taskati/core/constants/text_app.dart';
import 'package:taskati/core/shared/custom_form_field_global.dart';
import 'package:taskati/core/theme/color_app.dart';
import 'package:taskati/core/theme/textstyle_app.dart';

class CustomDate extends StatelessWidget {
  const CustomDate({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(TextApp.date, style: getTitleTextStyle()),
        SizedBox(height: 5.0),

        CustomFormFieldGlobal(
          readOnly: true,
          suffixIcon: Icon(Icons.calendar_month, color: ColorApp.primary),
        ),
      ],
    );
  }
}
