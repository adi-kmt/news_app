import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/common/api/api_client.dart';
import 'package:news_app/news_list_feature/data/repository/news_list_repository_impl.dart';
import 'package:news_app/news_list_feature/domain/usecase/news_list_usecase.dart';
import 'package:news_app/news_source_feature/data/repository/sources_list_repo_impl.dart';
import 'package:news_app/news_source_feature/data/sources/remote/sources_list_remote_source.dart';
import 'package:news_app/news_source_feature/domain/repository/source_list_repo.dart';
import 'package:news_app/news_source_feature/domain/usecase/sources_list_usecase.dart';
import '../../news_list_feature/data/sources/remote/news_list_remote_source.dart';
import '../../news_list_feature/domain/repository/news_list_repo.dart';

final getItInstance = GetIt.instance;

Future init() async {
  getItInstance.registerLazySingleton<ApiClient>(() => ApiClient(dio: Dio()));

  //NewsList feature Data-Domain module services
  getItInstance.registerLazySingleton<NewsListRemoteSource>(
      () => NewsListRemoteSource(apiClient: getItInstance()));
  getItInstance.registerLazySingleton<NewsListRepository>(
      () => NewsListRepositoryImpl(newsListRemoteSource: getItInstance()));
  getItInstance.registerLazySingleton<NewsListUseCase>(
      () => NewsListUseCase(newsListRepository: getItInstance()));

  //SourcesList feature Data-Domain module services
  getItInstance.registerLazySingleton<SourcesListRemoteSource>(
      () => SourcesListRemoteSource(apiClient: getItInstance()));
  getItInstance.registerLazySingleton<SourceListRepository>(() =>
      SourcesListRepositoryImpl(sourcesListRemoteSource: getItInstance()));
  getItInstance.registerLazySingleton<SourcesListUsecase>(
      () => SourcesListUsecase(sourceListRepository: getItInstance()));
}
