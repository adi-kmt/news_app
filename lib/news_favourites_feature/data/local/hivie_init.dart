import 'package:hive/hive.dart';

class HiveInit {
  late final HiveInterface hiveBox;

  HiveInterface openBox(String type) {
    try {
      return hiveBox;
    } catch (e) {
      throw Exception("Unable to open box");
    }
  }
}
