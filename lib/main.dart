import 'package:flutter/material.dart';
import 'package:taskati/core/service/service_app.dart';
import 'package:taskati/taskati_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceApp.setUp();
  runApp(const TaskatiApp());
}
