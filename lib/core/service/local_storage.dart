import 'package:hive/hive.dart';
import 'package:taskati/core/model/task_model.dart';

class LocalStorage {
  static Box? userBox;
  static Box<TaskModel>? taskBox;

  static init() {
    userBox = Hive.box("userBox");
    taskBox = Hive.box<TaskModel>("taskBox");
  }

  static cacheData(String key, dynamic value) async {
    await userBox?.put(key, value);
  }

  static getCachedData(String key) {
    return userBox?.get(key);
  }

  static cacheTaks(String key, TaskModel value) async {
    await taskBox?.put(key, value);
  }

  static getCachedTask(String key) {
    return taskBox?.get(key);
  }
}
