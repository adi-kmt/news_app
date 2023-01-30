import 'package:news_app/news_list_feature/domain/model/news_entity.dart';

abstract class NewsFavouriteRepository {
  Future<List<NewsArticleEntity>?> getFavouriteList();

  Future<void> addFavouriteItem(NewsArticleEntity newsArticleEntity);

  Future<void> removeFavouriteItem(String newsTitle);

  Future<bool> checkIfFavourite(String newsTitle);
}
