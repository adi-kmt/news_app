import 'package:news_app/news_list_feature/domain/model/news_entity.dart';

abstract class NewsFavouriteRepository {
  Future<Iterable<NewsArticleEntity>?> getFavouriteList();

  Future<void> addFavouriteItem(NewsArticleEntity newsArticleEntity);

  Future<void> removeFavouriteItem(int newsId);

  Future<bool> checkIfFavourite(NewsArticleEntity newsArticleEntity);
}
