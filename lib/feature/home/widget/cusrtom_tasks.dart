import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/constants/image_app.dart';
import 'package:taskati/core/constants/text_app.dart';
import 'package:taskati/core/model/task_model.dart';
import 'package:taskati/core/service/local_storage.dart';
import 'package:taskati/core/theme/color_app.dart';
import 'package:taskati/core/theme/textstyle_app.dart';
import 'package:taskati/feature/home/widget/custom_background_dismissible.dart';

class CusrtomTasks extends StatelessWidget {
  const CusrtomTasks({super.key, required this.selectdate});
  final String selectdate;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ValueListenableBuilder(
        valueListenable: LocalStorage.taskBox!.listenable(),
        builder: (context, box, child) {
          List<TaskModel> task =
              box.values
                  .cast<TaskModel>()
                  .where((element) => element.date == selectdate)
                  .toList();
          if (task.isEmpty) {
            return Center(child: Lottie.asset(AnimatedApp.empty));
          } else {
            return ListView.builder(
              itemCount: task.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder:
                  (context, index) => Dismissible(
                    key: UniqueKey(),
                    onDismissed: (direction) {
                      if (direction == DismissDirection.endToStart) {
                        box.delete(task[index].id);
                      } else {
                        box.put(
                          task[index].id,
                          task[index].copyWith(isCompleted: true),
                        );
                      }
                    },
                    secondaryBackground: CustomBackgroundDismissible(
                      mainAxisAlignment: MainAxisAlignment.end,
                      title: TextApp.delete,
                      color: ColorApp.red,
                      iconData: Icons.delete,
                    ),
                    background: CustomBackgroundDismissible(
                      title: TextApp.complete,
                      color: ColorApp.green,
                      iconData: Icons.done,
                    ),
                    child: CustomCardTask(tasks: task[index]),
                  ),
            );
          }
        },
      ),
    );
  }
}

class CustomCardTask extends StatelessWidget {
  const CustomCardTask({super.key, required this.tasks});
  final TaskModel tasks;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: customColor(),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tasks.title,
                  style: getTitleTextStyle(context, color: ColorApp.white),
                ),
                Gap(10.0),
                Row(
                  children: [
                    Icon(Icons.access_time, color: ColorApp.white, size: 20.0),
                    Gap(5.0),
                    Text(
                      "${tasks.startTime}  ${tasks.endTime}",
                      style: getSmallTextStyle(color: ColorApp.white),
                    ),
                  ],
                ),
                Gap(10.0),
                Text(
                  tasks.description,
                  overflow: TextOverflow.ellipsis,
                  style: getBodyTextStyle(context, color: ColorApp.white),
                ),
              ],
            ),
          ),
          Container(height: 65.0, width: .5, color: ColorApp.white),
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              tasks.isCompleted ? TextApp.completed : TextApp.today,
              style: getBodyTextStyle(context, color: ColorApp.white),
            ),
          ),
        ],
      ),
    );
  }

  customColor() {
    return tasks.isCompleted
        ? ColorApp.green
        : tasks.color == 0
        ? ColorApp.primary
        : tasks.color == 1
        ? ColorApp.red
        : ColorApp.orange;
  }
}
