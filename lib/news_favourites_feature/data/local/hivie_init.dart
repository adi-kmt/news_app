import 'package:hive/hive.dart';

class HiveInit {
  late final HiveInterface hiveBox;

  Future<Box> openBox(String type) async {
    try {
      final box = await hiveBox.openBox(type);
      return box;
    } catch (e) {
      throw Exception("Unable to open box");
    }
  }
}
