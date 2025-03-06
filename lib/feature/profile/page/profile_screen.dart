import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/constants/text_app.dart';
import 'package:taskati/core/service/local_storage.dart';
import 'package:taskati/core/theme/color_app.dart';
import 'package:taskati/feature/profile/widget/image_widget.dart';
import 'package:taskati/feature/profile/widget/name_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool? islight;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(TextApp.profile),
        actions: [
          IconButton(
            icon: Icon(
              islight ?? false ? Icons.dark_mode_outlined : Icons.sunny,
              color: ColorApp.primary,
            ),
            onPressed: () {
              setState(() {
                islight = LocalStorage.getCachedData('islight') ?? false;
                LocalStorage.cacheData('islight', !islight!);
              });
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageWidget(),
              Gap(13.0),
              Divider(
                indent: 20.0,
                endIndent: 20.0,
                thickness: 2,
                color: ColorApp.grey,
              ),
              Gap(25.0),
              NameWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
