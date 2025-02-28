import 'package:flutter/material.dart';
import 'package:taskati/core/constants/image_app.dart';
import 'package:taskati/core/theme/color_app.dart';
import 'package:taskati/core/theme/textstyle_app.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.sunny, color: ColorApp.primary),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage(ImageApp.user),
                backgroundColor: ColorApp.primary,
              ),
              SizedBox(height: 13.0),
              Divider(
                indent: 20.0,
                endIndent: 20.0,
                thickness: 2,
                color: ColorApp.grey,
              ),
              SizedBox(height: 25.0),
              Row(
                children: [
                  Text(
                    "Mansour sayed adam",
                    style: getTitleTextStyle(color: ColorApp.primary),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Container(
                      padding: EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: ColorApp.primary),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.edit_outlined, color: ColorApp.primary),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
