import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/common/di/get_it_module.dart' as get_it;
import 'package:news_app/news_app.dart';
import 'package:news_app/news_favourites_feature/data/local/hivie_init.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(get_it.init());
  await get_it.getItInstance<HiveInit>().init();
  runApp(const NewsApp());
}
