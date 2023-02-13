import 'package:news_app/news_favourites_feature/data/local/entity/news_article_entity.dart';
import 'package:news_app/news_list_feature/data/sources/remote/response/article_response_entity.dart';

class NewsArticleEntity {
  late String source;
  late String title;
  late String content;
  late String description;
  late String image;
  late bool isFavourite;

  NewsArticleEntity(
      {required this.content,
      required this.description,
      required this.title,
      required this.source,
      required this.image,
      required this.isFavourite});

  factory NewsArticleEntity.fromNewsArticleEntitiy(
      NewsLocalEntity newsLocalEntity) {
    return NewsArticleEntity(
        content: newsLocalEntity.content,
        description: newsLocalEntity.description,
        title: newsLocalEntity.title,
        source: newsLocalEntity.source,
        image: newsLocalEntity.image,
        isFavourite: newsLocalEntity.isFavourite);
  }

  NewsArticleEntity deepCopy({
    required String content,
    required String description,
    required String title,
    required String source,
    required String image,
    required bool isFavourite,
  }) {
    return NewsArticleEntity(
        content: content,
        description: description,
        title: title,
        source: source,
        image: image,
        isFavourite: isFavourite);
  }
}

extension ArticleResponseExtension on ArticleResponseArticles {
  NewsArticleEntity get getArticleEntity => NewsArticleEntity(
      content: this.content ?? "",
      description: this.description ?? "",
      title: this.title ?? "",
      source: this.xSource?.name ?? "",
      image: this.urlToImage ?? "",
      isFavourite: false);
}
