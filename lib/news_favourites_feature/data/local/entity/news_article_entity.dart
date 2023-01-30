import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app/news_list_feature/domain/model/news_entity.dart';

part 'news_article_entity.g.dart';

@HiveType(typeId: 0)
class NewsLocalEntity extends NewsArticleEntity {
  @HiveField(0)
  late String title;

  @HiveField(1)
  late String content;

  @HiveField(2)
  late String description;

  @HiveField(3)
  late String image;

  @HiveField(4)
  late bool isFavourite;

  @HiveField(5)
  late String source;

  NewsLocalEntity(
      {required this.content,
      required this.description,
      required this.title,
      required this.source,
      required this.image,
      required this.isFavourite})
      : super(
            content: content,
            description: description,
            source: source,
            isFavourite: isFavourite,
            image: image,
            title: title);

  factory NewsLocalEntity.fromNewsEntity(NewsArticleEntity newsArticleEntity) {
    return NewsLocalEntity(
        content: newsArticleEntity.content,
        description: newsArticleEntity.description,
        title: newsArticleEntity.title,
        source: newsArticleEntity.source,
        image: newsArticleEntity.image,
        isFavourite: newsArticleEntity.isFavourite);
  }
}
