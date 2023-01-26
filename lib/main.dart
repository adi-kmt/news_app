import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/common/api/api_client.dart';
import 'package:news_app/common/domain/no_param.dart';
import 'package:news_app/news_list_feature/data/repository/news_list_repository_impl.dart';
import 'package:news_app/news_list_feature/data/sources/remote/news_list_remote_source.dart';
import 'package:news_app/news_list_feature/data/sources/remote/response/articles_response.dart';
import 'package:news_app/news_list_feature/domain/usecase/news_list_usecase.dart';
import 'package:logging/logging.dart';

import 'common/api/response_wrapper.dart';

void main() async {
  final apiClient = ApiClient(dio: Dio());
  final source = NewsListRemoteSource(apiClient: apiClient);
  final repo = NewsListRepositoryImpl(newsListRemoteSource: source);
  final usecase = NewsListUseCase(newsListRepository: repo);
  final list = await usecase.call(NoParams());
  Logger.root.log(Level.SEVERE, "Got list");
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
