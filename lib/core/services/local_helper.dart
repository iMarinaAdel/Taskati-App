import 'package:hive/hive.dart';
import 'package:taskati/core/models/task_model.dart';

class LocalHelper {
  static late Box userBox;
  static late Box<TaskModel> taskBox;

  static String kUserBox = "user";
  static String kTaskBox = "task";

  static String kName = "name";
  static String kImage = "image";
  static String kIsUpload = "IsUpload";

  static init() async {
    await Hive.openBox(kUserBox);
    userBox = Hive.box(kUserBox);
    Hive.registerAdapter<TaskModel>(TaskModelAdapter());
    await Hive.openBox<TaskModel>(kTaskBox);
    taskBox = Hive.box(kTaskBox);
  }

  static cacheData(String key, dynamic value) {
    userBox.put(key, value);
  }

  static getData(String key) {
    return userBox.get(key);
  }

  static cacheTask(String key, TaskModel task) {
    taskBox.put(key, task);
  }

  static getTask(String key) {
    return taskBox.get(key);
  }
}
