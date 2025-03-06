import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/constants/text_app.dart';
import 'package:taskati/core/extensions/showbottomsheet.dart';
import 'package:taskati/core/extensions/navigator_app.dart';
import 'package:taskati/core/service/local_storage.dart';
import 'package:taskati/core/shared/custom_elevated_button_global.dart';
import 'package:taskati/core/shared/custom_form_field_global.dart';
import 'package:taskati/core/theme/color_app.dart';
import 'package:taskati/core/theme/textstyle_app.dart';

class NameWidget extends StatefulWidget {
  const NameWidget({super.key});

  @override
  State<NameWidget> createState() => _NameWidgetState();
}

class _NameWidgetState extends State<NameWidget> {
  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          LocalStorage.getCachedData("name"),
          style: getTitleTextStyle(context, color: ColorApp.primary),
        ),
        Spacer(),
        IconButton(
          onPressed: () {
            context.bottomSheet(
              color: Theme.of(context).scaffoldBackgroundColor,
              height: 200.0,
              widget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomFormFieldGlobal(
                    controller: name,
                    hintText: TextApp.entername,
                  ),
                  Gap(10.0),
                  CustomElevatedButtonGlobal(
                    title: TextApp.uploadname,
                    onPressed: () {
                      setState(() {
                        LocalStorage.cacheData("name", name.text);
                        name.clear();
                        context.pop();
                      });
                    },
                  ),
                ],
              ),
            );
          },
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
    );
  }
}
