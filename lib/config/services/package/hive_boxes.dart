import 'package:hive_flutter/hive_flutter.dart';

import '../../constants/enums.dart';
import '../../constants/tags.dart';

class Boxes {
  static Box get base => Hive.box(Tags.hiveBase);

  static bool? get themeSystem => base.get(Tags.themeSystem);
  static void putThemeSystem(bool val) => base.put(Tags.themeSystem, val);
  static bool? get themeLight => base.get(Tags.themeLight);
  static void putThemeLight(bool val) => base.put(Tags.themeLight, val);
  static Lang get lang => Lang.values.byName(base.get(Tags.hiveLang) ?? "TM");
  static void putLang(Lang val) => base.put(Tags.hiveLang, val.name);

  static String? get token => base.get(Tags.hiveToken);
  static void putToken(String? val) => base.put(Tags.hiveToken, val);
  static String? get cookie => base.get(Tags.hiveCookie);
  static void putCookie(String? val) => base.put(Tags.hiveCookie, val);

  static bool? get isLogin => base.get(Tags.hiveIsLogin);
  static void putIsLogin(bool val) => base.put(Tags.hiveIsLogin, val);
}
