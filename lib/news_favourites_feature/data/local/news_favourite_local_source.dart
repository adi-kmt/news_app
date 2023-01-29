import 'package:hive/hive.dart';
import 'package:news_app/utils/string_utils.dart';

import 'entity/news_article_entity.dart';

class NewsFavouriteLocalSource {
  late final HiveInterface hiveBox;

  NewsFavouriteLocalSource({required this.hiveBox});

  Future<void> saveMovie(NewsLocalEntity newsLocalEntity) async {
    final newsBox = await _openBox(StringUtils.newsBox);
    await newsBox.put(newsLocalEntity.id, newsLocalEntity);
  }

  Future<void> deleteMovie(int newsId) async {
    final newsBox = await _openBox(StringUtils.newsBox);
    await newsBox.delete(newsId);
  }

  Future<NewsLocalEntity> getMovie(int newsId) async {
    final newsBox = await _openBox(StringUtils.newsBox);
    return await newsBox.get(newsId);
  }

  Future<List<NewsLocalEntity>> getAllNewsFavourite() async {
    final newsBox = await _openBox(StringUtils.newsBox);
    final newsKeys = newsBox.keys;
    List<NewsLocalEntity> newsList = [];
    newsKeys.forEach((newsKey) {
      final newsItem = newsBox.get(newsKey);
      if (newsItem != null) {
        newsList.add(newsBox.get(newsKey));
      }
    });
    return newsList;
  }

  Future<bool> checkIfFavourite(int newsId) async {
    final newsBox = await hiveBox.openBox(StringUtils.newsBox);
    final isFavourite = newsBox.containsKey(newsId);
    return isFavourite;
  }

  Future<Box> _openBox(String type) async {
    try {
      final box = await hiveBox.openBox(type);
      return box;
    } catch (e) {
      throw Exception("Can't open box");
    }
  }
}
