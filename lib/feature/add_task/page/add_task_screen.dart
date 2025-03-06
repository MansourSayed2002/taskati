import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/constants/text_app.dart';
import 'package:taskati/core/extensions/message_bar.dart';
import 'package:taskati/core/extensions/navigator_app.dart';
import 'package:taskati/core/model/task_model.dart';
import 'package:taskati/core/service/local_storage.dart';
import 'package:taskati/core/shared/custom_elevated_button_global.dart';
import 'package:taskati/core/shared/custom_form_field_global.dart';
import 'package:taskati/core/theme/color_app.dart';
import 'package:taskati/core/theme/textstyle_app.dart';
import 'package:taskati/feature/home/page/home_screen.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  int selectIndex = 0;
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    startDate.text = DateFormat("HH:mm a").format(DateTime.now());
    dateController.text = DateFormat("yyyy/MM/dd").format(DateTime.now());
    endDate.text = DateFormat("HH:mm a").format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(TextApp.addTask), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              customTitle(),
              Gap(13.0),
              customDescription(),
              Gap(13.0),
              customDate(),
              Gap(13.0),
              customTime(),
              Gap(13.0),
              customColor(),
            ],
          ),
        ),
      ),
    );
  }

  Column customTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(TextApp.title, style: getTitleTextStyle(context)),
        Gap(5.0),
        CustomFormFieldGlobal(controller: title, hintText: TextApp.entertitle),
      ],
    );
  }

  Column customDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(TextApp.description, style: getTitleTextStyle(context)),
        Gap(5.0),
        CustomFormFieldGlobal(
          controller: description,
          hintText: TextApp.enterdes,
          maxLines: 3,
        ),
      ],
    );
  }

  Column customDate() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(TextApp.date, style: getTitleTextStyle(context)),
        SizedBox(height: 5.0),

        CustomFormFieldGlobal(
          onTap: () async {
            DateTime? date = await showDatePicker(
              context: context,
              firstDate: DateTime.now(),
              initialDate: DateTime.now(),
              lastDate: DateTime(3000),
            );
            if (date != null) {
              setState(() {
                dateController.text = DateFormat("yyyy/MM/dd").format(date);
              });
            }
          },
          readOnly: true,
          controller: dateController,
          style: getTitleTextStyle(context),
          suffixIcon: Icon(Icons.calendar_month, color: ColorApp.primary),
        ),
      ],
    );
  }

  Row customTime() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(TextApp.startDate, style: getTitleTextStyle(context)),
              SizedBox(height: 5.0),
              CustomFormFieldGlobal(
                onTap: () async {
                  var time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (time != null) {
                    setState(() {
                      startDate.text = time.format(context);
                    });
                  }
                },
                readOnly: true,
                controller: startDate,
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
              Text(TextApp.endDate, style: getTitleTextStyle(context)),
              CustomFormFieldGlobal(
                onTap: () async {
                  var time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (time != null) {
                    setState(() {
                      endDate.text = time.format(context);
                    });
                  }
                },
                readOnly: true,
                controller: endDate,
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

  Row customColor() {
    return Row(
      children: [
        Row(
          children: List.generate(3, (index) {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectIndex = index;
                  });
                },
                child: CircleAvatar(
                  radius: 20.0,
                  backgroundColor:
                      index == 0
                          ? ColorApp.primary
                          : index == 1
                          ? ColorApp.red
                          : ColorApp.orange,
                  child:
                      selectIndex == index
                          ? Icon(Icons.done, color: ColorApp.white)
                          : null,
                ),
              ),
            );
          }),
        ),
        Spacer(),
        CustomElevatedButtonGlobal(
          width: 150,
          title: TextApp.createTask,
          onPressed: () {
            var key =
                DateTime.now().millisecondsSinceEpoch.toString() + title.text;
            LocalStorage.cacheTaks(
              key,
              TaskModel(
                id: key,
                title: title.text,
                description: description.text,
                date: dateController.text,
                startTime: startDate.text,
                endTime: endDate.text,
                color: selectIndex,
                isCompleted: false,
              ),
            );
            context.pushReplacement(HomeScreen());
            context.messageBar(TextApp.doneAddTaks, ColorApp.primary);
          },
        ),
      ],
    );
  }
}
