import 'dart:io';
import 'package:flutter/material.dart';
import 'package:taskati/core/class/local_storage.dart';
import 'package:taskati/core/constants/image_app.dart';
import 'package:taskati/core/constants/text_app.dart';
import 'package:taskati/core/theme/color_app.dart';
import 'package:taskati/core/theme/textstyle_app.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocalStorage.getCachedData("name"),
                style: getTitleTextStyle(color: ColorApp.primary),
              ),
              Text(TextApp.startMessage, style: getBodyTextStyle()),
            ],
          ),
        ),
        CircleAvatar(
          radius: 26.0,
          backgroundImage:
              LocalStorage.getCachedData("image") != null
                  ? FileImage(File(LocalStorage.getCachedData("image")))
                  : AssetImage(ImageApp.user),
        ),
      ],
    );
  }
}
