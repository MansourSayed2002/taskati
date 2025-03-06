import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:taskati/core/service/local_storage.dart';
import 'package:taskati/core/theme/theme_app.dart';
import 'package:taskati/feature/intro/splash_screen.dart';

class TaskatiApp extends StatelessWidget {
  const TaskatiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: LocalStorage.userBox!.listenable(),
      builder:
          (context, value, child) => MaterialApp(
            themeMode:
                LocalStorage.getCachedData("islight") ?? false
                    ? ThemeMode.light
                    : ThemeMode.dark,
            theme: ThemeApp.themeLight,
            darkTheme: ThemeApp.themeDark,
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          ),
    );
  }
}
