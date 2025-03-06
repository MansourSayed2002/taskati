import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/theme/color_app.dart';
import 'package:taskati/core/theme/textstyle_app.dart';
import 'package:taskati/feature/home/widget/cusrtom_tasks.dart';
import 'package:taskati/feature/home/widget/custom_app_bar.dart';
import 'package:taskati/feature/home/widget/custom_today.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedDate = DateFormat("yyyy/MM/dd").format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CustomAppBar(),
              Gap(10.0),
              CustomToday(),
              Gap(7.0),
              DatePicker(
                DateTime.now(),
                initialSelectedDate: DateTime.now(),
                selectionColor: ColorApp.primary,
                selectedTextColor: Colors.white,
                dayTextStyle: getBodyTextStyle(
                  context,
                  color: ColorApp.primary,
                ),
                monthTextStyle: getBodyTextStyle(
                  context,
                  color: ColorApp.primary,
                ),
                dateTextStyle: getTitleTextStyle(
                  context,
                  color: ColorApp.primary,
                ),
                width: 83.0,
                height: 94.0,
                onDateChange: (date) {
                  setState(() {
                    selectedDate = DateFormat("yyyy/MM/dd").format(date);
                  });
                },
              ),
              CusrtomTasks(selectdate: selectedDate),
            ],
          ),
        ),
      ),
    );
  }
}
