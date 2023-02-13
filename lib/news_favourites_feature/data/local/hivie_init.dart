import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'entity/news_article_entity.dart';

class HiveInit {
  Future<Box> openBox(String type) {
    try {
      return Hive.openBox(type);
    } catch (e) {
      throw Exception("Unable to open box");
    }
  }

  Future<void> init() async {
    final appDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    await Hive.initFlutter(appDocumentDir.path);
    Hive.registerAdapter(NewsLocalEntityAdapter());
  }
}
