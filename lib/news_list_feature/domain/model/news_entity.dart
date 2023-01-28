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
