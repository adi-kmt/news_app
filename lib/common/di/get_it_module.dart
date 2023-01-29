import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/common/api/api_client.dart';
import 'package:news_app/news_favourites_feature/data/repository/news_favourite_repo_impl.dart';
import 'package:news_app/news_favourites_feature/domain/repository/news_favourite_repository.dart';
import 'package:news_app/news_favourites_feature/domain/usecase/add_favourite_news_item.dart';
import 'package:news_app/news_favourites_feature/domain/usecase/get_favourite_news_list.dart';
import 'package:news_app/news_favourites_feature/domain/usecase/remove_favourite_news_item.dart';
import 'package:news_app/news_favourites_feature/ui/bloc/news_favourite_cubit.dart';
import 'package:news_app/news_item_detail_feature/ui/bloc/news_item_detail_cubit.dart';
import 'package:news_app/news_list_feature/data/repository/news_list_repository_impl.dart';
import 'package:news_app/news_list_feature/domain/usecase/news_list_usecase.dart';
import 'package:news_app/news_list_feature/ui/bloc/news_list_cubit.dart';
import 'package:news_app/news_source_feature/data/repository/sources_list_repo_impl.dart';
import 'package:news_app/news_source_feature/data/sources/remote/sources_list_remote_source.dart';
import 'package:news_app/news_source_feature/domain/repository/source_list_repo.dart';
import 'package:news_app/news_source_feature/domain/usecase/sources_list_usecase.dart';
import 'package:news_app/news_source_feature/ui/bloc/news_source_list_cubit.dart';

import '../../news_favourites_feature/data/local/news_favourite_local_source.dart';
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

  // News Favourite Data-Domain module services
  getItInstance.registerLazySingleton<NewsFavouriteLocalSource>(
      () => NewsFavouriteLocalSource());
  getItInstance.registerLazySingleton<NewsFavouriteRepository>(() =>
      NewsFavouriteRepositoryImpl(newsFavouriteLocalSource: getItInstance()));
  getItInstance.registerLazySingleton(() =>
      GetFavouriteNewsListUseCase(newsFavouriteRepository: getItInstance()));
  getItInstance.registerLazySingleton(() =>
      AddFavouriteNewsItemUseCase(newsFavouriteRepository: getItInstance()));
  getItInstance.registerLazySingleton(() =>
      RemoveFavouriteNewsItemUseCase(newsFavouriteRepository: getItInstance()));

  //Providing cubits
  getItInstance.registerFactory(() => NewsListCubit(
      newsListUseCase: getItInstance(),
      removeFavouriteNewsItemUseCase: getItInstance(),
      addFavouriteNewsItemUseCase: getItInstance()));
  getItInstance.registerFactory(
      () => NewsSourceListCubit(sourcesListUsecase: getItInstance()));
  getItInstance.registerFactory(() => NewsItemDetailCubit());
  getItInstance.registerFactory(() => NewsFavouriteCubit(
      getFavouriteNewsListUseCase: getItInstance(),
      removeFavouriteNewsItemUseCase: getItInstance(),
      addFavouriteNewsItemUseCase: getItInstance()));
}
