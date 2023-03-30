import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:paytr_case/app_constant/app_constant.dart';

class HiveManager {
  static init() async {
    var dir = await getApplicationDocumentsDirectory();

    Hive.init(dir.path);

    if (!Hive.isBoxOpen(authBox)) {
      await Hive.openBox(authBox);
    }
  }

  static bool isAuth() {
    var box = Hive.box(authBox);
    return box.get(userNameKey) != null && box.get(passwordKey)!=null;
  }

  static void setAuth(String? userName, String? password) {
    if (userName == null || password == null) {
      clearAuth();
      return;
    }

    var box = Hive.box(authBox);
    box.put(userNameKey, userName);
    box.put(passwordKey, password);
  }

  static String? getUserName() {
    var box = Hive.box(authBox);
    return box.get(userNameKey);
  }

  static String? getPassword() {
    var box = Hive.box(authBox);
    return box.get(passwordKey);
  }

  static clearAuth() {
    var box = Hive.box(authBox);
    box.clear();
  }
}
