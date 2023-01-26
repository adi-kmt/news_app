import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/common/domain/no_param.dart';
import 'package:news_app/common/di/get_it_module.dart' as get_it;
import 'package:news_app/news_list_feature/data/sources/remote/response/articles_response.dart';
import 'package:news_app/news_list_feature/domain/usecase/news_list_usecase.dart';
import 'package:logging/logging.dart';

import 'common/api/response_wrapper.dart';

void main() async {
  //TODO to check better init of getIt
  unawaited(get_it.init());
  final usecase = get_it.getItInstance<NewsListUseCase>();
  final list = await usecase.call(NoParams());
  if (list is Success) {
    final dataList = list.data as List<ArticleResponse>;
    dataList.forEach((article) {
      Logger.root.log(Level.SEVERE, "articles recieved are ${article.title}");
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
