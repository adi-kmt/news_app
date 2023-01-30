import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/news_app.dart';
import 'package:news_app/common/di/get_it_module.dart' as get_it;

void main() async {
  //TODO to check better init of getIt
  unawaited(get_it.init());
  runApp(const NewsApp());
}
