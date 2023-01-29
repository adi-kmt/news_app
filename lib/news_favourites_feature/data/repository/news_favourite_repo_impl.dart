import 'package:news_app/news_favourites_feature/data/local/entity/news_article_entity.dart';
import 'package:news_app/news_favourites_feature/data/local/news_favourite_local_source.dart';
import 'package:news_app/news_favourites_feature/domain/repository/news_favourite_repository.dart';
import 'package:news_app/news_list_feature/domain/model/news_entity.dart';

class NewsFavouriteRepositoryImpl implements NewsFavouriteRepository {
  late final NewsFavouriteLocalSource newsFavouriteLocalSource;

  NewsFavouriteRepositoryImpl({required this.newsFavouriteLocalSource});

  @override
  Future<void> addFavouriteItem(NewsArticleEntity newsArticleEntity) async {
    final newsLocalEntity = NewsLocalEntity.fromNewsEntity(newsArticleEntity);
    return await newsFavouriteLocalSource.saveMovie(newsLocalEntity);
  }

  @override
  Future<bool> checkIfFavourite(int newsId) async {
    return await newsFavouriteLocalSource.checkIfFavourite(newsId);
  }

  @override
  Future<Iterable<NewsArticleEntity>?> getFavouriteList() async {
    final newsArticleList =
        await newsFavouriteLocalSource.getAllNewsFavourite();
    return newsArticleList
        .map((newsItem) => NewsArticleEntity.fromNewsArticleEntitiy(newsItem));
  }

  @override
  Future<void> removeFavouriteItem(int newsId) async {
    return await newsFavouriteLocalSource.deleteMovie(newsId);
  }
}
