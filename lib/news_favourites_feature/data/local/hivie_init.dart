import 'package:hive/hive.dart';

class HiveInit {
  late final HiveInterface hiveBox;

  Future<Box> openBox(String type) {
    try {
      return hiveBox.openBox(type);
    } catch (e) {
      throw Exception("Unable to open box");
    }
  }
}
