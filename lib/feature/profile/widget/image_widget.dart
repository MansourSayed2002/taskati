import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/constants/text_app.dart';
import 'package:taskati/core/extensions/showbottomsheet.dart';
import 'package:taskati/core/service/local_storage.dart';
import 'package:taskati/core/shared/custom_elevated_button_global.dart';
import 'package:taskati/core/theme/color_app.dart';

class ImageWidget extends StatefulWidget {
  const ImageWidget({super.key});

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 80,
      backgroundImage: FileImage(File(LocalStorage.getCachedData("image"))),
      backgroundColor: ColorApp.primary,
      child: Stack(
        children: [
          Positioned(
            bottom: -3.0,
            right: 2.0,
            child: IconButton(
              icon: Icon(
                Icons.camera_alt,
                color: Theme.of(context).iconTheme.color,
                size: 30.0,
              ),
              onPressed: () {
                context.bottomSheet(
                  color: Theme.of(context).scaffoldBackgroundColor,

                  height: 200.0,
                  widget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomElevatedButtonGlobal(
                        title: TextApp.upFromCamera,
                        onPressed: () {
                          uploadImage(true);
                        },
                      ),
                      SizedBox(height: 10.0),
                      CustomElevatedButtonGlobal(
                        title: TextApp.upFromGallery,
                        onPressed: () {
                          uploadImage(false);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  uploadImage(bool iscamera) async {
    XFile? image = await ImagePicker().pickImage(
      source: iscamera ? ImageSource.camera : ImageSource.gallery,
    );
    if (image != null) {
      setState(() {
        LocalStorage.cacheData("image", image.path);
      });
    }
  }
}
