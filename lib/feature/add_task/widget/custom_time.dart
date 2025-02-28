import 'package:flutter/material.dart';
import 'package:taskati/core/constants/text_app.dart';
import 'package:taskati/core/shared/custom_form_field_global.dart';
import 'package:taskati/core/theme/color_app.dart';
import 'package:taskati/core/theme/textstyle_app.dart';

class CustomTime extends StatelessWidget {
  const CustomTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(TextApp.startDate, style: getTitleTextStyle()),
              SizedBox(height: 5.0),
              CustomFormFieldGlobal(
                readOnly: true,
                suffixIcon: Icon(
                  Icons.access_time_rounded,
                  color: ColorApp.primary,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 8.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5.0),
              Text(TextApp.startDate, style: getTitleTextStyle()),
              CustomFormFieldGlobal(
                readOnly: true,
                suffixIcon: Icon(
                  Icons.access_time_rounded,
                  color: ColorApp.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
