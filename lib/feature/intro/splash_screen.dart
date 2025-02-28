import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/constants/image_app.dart';
import 'package:taskati/core/constants/text_app.dart';
import 'package:taskati/core/extensions/navigator_app.dart';
import 'package:taskati/core/theme/color_app.dart';
import 'package:taskati/core/theme/textstyle_app.dart';
import 'package:taskati/feature/upload/upload_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      context.pushReplacement(const UploadScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(AnimatedApp.logo, height: 250),
            Text(TextApp.appName, style: getTitleTextStyle(fontSize: 28.0)),
            SizedBox(height: 10.0),
            Text(TextApp.subtitle, style: getSmallTextStyle()),
          ],
        ),
      ),
    );
  }
}
