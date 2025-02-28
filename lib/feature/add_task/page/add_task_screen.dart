import 'package:flutter/material.dart';
import 'package:taskati/core/constants/text_app.dart';
import 'package:taskati/core/theme/color_app.dart';
import 'package:taskati/core/theme/textstyle_app.dart';
import 'package:taskati/feature/add_task/widget/custom_color.dart';
import 'package:taskati/feature/add_task/widget/custom_date.dart';
import 'package:taskati/feature/add_task/widget/custom_description.dart';
import 'package:taskati/feature/add_task/widget/custom_time.dart';
import 'package:taskati/feature/add_task/widget/custom_title.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.white,
      appBar: AppBar(
        backgroundColor: ColorApp.white,

        title: Text(TextApp.addTask, style: getTitleTextStyle()),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTitle(),
            SizedBox(height: 13.0),
            CustomDescription(),
            SizedBox(height: 13.0),
            CustomDate(),
            SizedBox(height: 13.0),
            CustomTime(),
            SizedBox(height: 13.0),
            CustomColor(),
          ],
        ),
      ),
    );
  }
}
