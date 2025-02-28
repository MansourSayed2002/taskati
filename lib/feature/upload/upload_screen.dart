import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/class/local_storage.dart';
import 'package:taskati/core/constants/image_app.dart';
import 'package:taskati/core/constants/text_app.dart';
import 'package:taskati/core/extensions/message_bar.dart';
import 'package:taskati/core/extensions/navigator_app.dart';
import 'package:taskati/core/shared/custom_elevated_button_global.dart';
import 'package:taskati/core/shared/custom_form_field_global.dart';
import 'package:taskati/core/theme/color_app.dart';
import 'package:taskati/core/theme/textstyle_app.dart';
import 'package:taskati/feature/home/page/home_screen.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  String? path;
  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.dark,
      appBar: AppBar(
        backgroundColor: ColorApp.dark,
        actions: [
          TextButton(
            onPressed: () {
              if (path != null && name.text.isNotEmpty) {
                LocalStorage.cacheData("name", name.text);
                LocalStorage.cacheData("image", path);
                context.pushReplacement(const HomeScreen());
              } else if (path == null && name.text.isNotEmpty) {
                context.messageBar("Please select an image");
              } else if (path != null && name.text.isEmpty) {
                context.messageBar("Please enter a name");
              } else {
                context.messageBar("Please select an image and enter a name");
              }
            },
            child: Text(
              TextApp.done,
              style: getTitleTextStyle(color: ColorApp.primary),
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundImage:
                      path != null
                          ? FileImage(File(path!))
                          : AssetImage(ImageApp.user),
                  backgroundColor: ColorApp.primary,
                ),
                SizedBox(height: 20.0),
                CustomElevatedButtonGlobal(
                  width: 250.0,
                  title: TextApp.upFromCamera,
                  onPressed: () {
                    uploadImage(true);
                  },
                ),
                SizedBox(height: 10.0),
                CustomElevatedButtonGlobal(
                  width: 250.0,
                  title: TextApp.upFromGallery,
                  onPressed: () {
                    uploadImage(false);
                  },
                ),
                SizedBox(height: 20.0),
                Divider(indent: 10.0, endIndent: 10.0, thickness: 0.3),
                SizedBox(height: 20.0),
                CustomFormFieldGlobal(
                  controller: name,
                  hintText: TextApp.entername,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  uploadImage(bool iscamera) async {
    XFile? image = await ImagePicker().pickImage(
      source: iscamera ? ImageSource.camera : ImageSource.gallery,
    );
    if (image != null) {
      setState(() {
        path = image.path;
      });
    }
  }
}
