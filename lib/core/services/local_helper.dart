import 'package:hive/hive.dart';

class LocalHelper {
  static late Box userBox;
  static String kName = "name";
  static String kImage = "image";
  static String kIsUpload = "IsUpload";

  static init() async {
    await Hive.openBox("user");
    userBox = Hive.box("user");
  }

  static cacheData(String key, dynamic value) {
    userBox.put(key, value);
  }

  static getData(String key) {
    return userBox.get(key);
  }
}
