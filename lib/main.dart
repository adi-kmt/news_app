import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/common/di/get_it_module.dart' as get_it;

void main() async {
  //TODO to check better init of getIt
  unawaited(get_it.init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Placeholder(),
    );
  }
}
