import 'package:news_app/news_favourites_feature/data/local/hivie_init.dart';
import 'package:news_app/utils/string_utils.dart';

import 'entity/news_article_entity.dart';

class NewsFavouriteLocalSource {
  late final HiveInit hiveBox;

  NewsFavouriteLocalSource({required this.hiveBox});

  Future<void> saveMovie(NewsLocalEntity newsLocalEntity) async {
    final newsBox = await hiveBox.openBox(StringUtils.newsBox);
    return await newsBox.put(newsLocalEntity.title, newsLocalEntity);
  }

  Future<void> deleteMovie(String newsTitle) async {
    final newsBox = await hiveBox.openBox(StringUtils.newsBox);
    return await newsBox.delete(newsTitle);
  }

  Future<bool> checkIfFavourite(String newsTitle) async {
    final newsBox = await hiveBox.openBox(StringUtils.newsBox);
    final isPresent = await newsBox.get(newsTitle);
    if (isPresent != null) {
      return true;
    } else {
      return false;
    }
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
}
