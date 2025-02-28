import 'package:hive_flutter/adapters.dart';
import 'package:taskati/core/class/local_storage.dart';

class ServiceApp {
  static setUp() async {
    await Hive.initFlutter();
    await Hive.openBox("userBox");
    await LocalStorage.init();
  }
}
