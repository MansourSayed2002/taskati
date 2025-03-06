import 'package:hive_flutter/adapters.dart';
import 'package:taskati/core/model/task_model.dart';
import 'package:taskati/core/service/local_storage.dart';

class ServiceApp {
  static setUp() async {
    await Hive.initFlutter();
    Hive.registerAdapter(TaskModelAdapter());
    await Hive.openBox<TaskModel>("taskBox");
    await Hive.openBox("userBox");
    await LocalStorage.init();
  }
}
