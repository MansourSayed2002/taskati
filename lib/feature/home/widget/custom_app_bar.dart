import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/extensions/navigator_app.dart';
import 'package:taskati/core/service/local_storage.dart';
import 'package:taskati/core/constants/image_app.dart';
import 'package:taskati/core/constants/text_app.dart';
import 'package:taskati/core/theme/color_app.dart';
import 'package:taskati/core/theme/textstyle_app.dart';
import 'package:taskati/feature/profile/page/profile_screen.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 26.0,
          backgroundImage:
              LocalStorage.getCachedData("image") != null
                  ? FileImage(File(LocalStorage.getCachedData("image")))
                  : AssetImage(ImageApp.user),
        ),
        Gap(10.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                TextApp.hello + LocalStorage.getCachedData("name"),
                style: getTitleTextStyle(context, color: ColorApp.primary),
              ),
              Text(TextApp.startMessage, style: getBodyTextStyle(context)),
            ],
          ),
        ),

        IconButton(
          onPressed: () {
            context.push(ProfileScreen());
          },
          icon: Icon(Icons.person_2, size: 30.0),
          color: ColorApp.primary,
        ),
      ],
    );
  }
}
