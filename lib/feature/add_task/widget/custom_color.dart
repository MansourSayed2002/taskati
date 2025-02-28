import 'package:flutter/material.dart';
import 'package:taskati/core/constants/text_app.dart';
import 'package:taskati/core/shared/custom_elevated_button_global.dart';
import 'package:taskati/core/theme/color_app.dart';

class CustomColor extends StatefulWidget {
  const CustomColor({super.key});

  @override
  State<CustomColor> createState() => _CustomColorState();
}

class _CustomColorState extends State<CustomColor> {
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
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
          onPressed: () {},
        ),
      ],
    );
  }
}
