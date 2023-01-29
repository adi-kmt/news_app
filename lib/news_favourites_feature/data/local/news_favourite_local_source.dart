import 'package:news_app/news_favourites_feature/data/local/hivie_init.dart';
import 'package:news_app/utils/string_utils.dart';

import 'entity/news_article_entity.dart';

class NewsFavouriteLocalSource {
  late final HiveInit hiveBox;

  NewsFavouriteLocalSource({required this.hiveBox});

  Future<void> saveMovie(NewsLocalEntity newsLocalEntity) async {
    final newsBox = await hiveBox.openBox(StringUtils.newsBox);
    await newsBox.put(newsLocalEntity.id, newsLocalEntity);
  }

  Future<void> deleteMovie(int newsId) async {
    final newsBox = await hiveBox.openBox(StringUtils.newsBox);
    await newsBox.delete(newsId);
  }

  Future<List<NewsLocalEntity>> getAllNewsFavourite() async {
    final newsBox = await hiveBox.openBox(StringUtils.newsBox);
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
}
