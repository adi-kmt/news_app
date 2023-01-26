import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/common/domain/no_param.dart';
import 'package:news_app/common/di/get_it_module.dart' as get_it;
import 'package:news_app/news_list_feature/domain/usecase/news_list_usecase.dart';
import 'package:logging/logging.dart';
import 'package:news_app/news_source_feature/data/sources/remote/response/sources_response_entity.dart';
import 'package:news_app/news_source_feature/domain/usecase/sources_list_usecase.dart';
import 'common/api/response_wrapper.dart';
import 'news_list_feature/data/sources/remote/response/article_response_entity.dart';

void main() async {
  //TODO to check better init of getIt
  unawaited(get_it.init());
  final usecase = get_it.getItInstance<SourcesListUsecase>();
  final list = await usecase.call(NoParams());
  if (list is Success) {
    final dataList = list.data as List<SourcesResponseSources>;
    dataList.forEach((article) {
      Logger.root.log(Level.SEVERE, "articles recieved are ${article.name}");
    });
  } else {
    Logger.root.log(Level.SEVERE, "Api failed");
  }
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
