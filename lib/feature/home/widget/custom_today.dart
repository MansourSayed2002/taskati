import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/constants/text_app.dart';
import 'package:taskati/core/extensions/navigator_app.dart';
import 'package:taskati/core/shared/custom_elevated_button_global.dart';
import 'package:taskati/core/theme/textstyle_app.dart';
import 'package:taskati/feature/add_task/page/add_task_screen.dart';

class CustomToday extends StatelessWidget {
  const CustomToday({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMEd().format(DateTime.now()),
                style: getTitleTextStyle(context),
              ),
              Text(
                TextApp.today,
                style: getTitleTextStyle(context, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        CustomElevatedButtonGlobal(
          title: "+ ${TextApp.addTask}",
          onPressed: () {
            context.push(const AddTaskScreen());
          },
          width: 138.0,
        ),
      ],
    );
  }
}
