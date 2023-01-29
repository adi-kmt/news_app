import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app/news_list_feature/domain/model/news_entity.dart';

part 'news_article_entity.g.dart';

@HiveType(typeId: 0)
class NewsLocalEntity extends NewsArticleEntity {
  @HiveField(0)
  final int id;

  @HiveField(1)
  late String title;

  @HiveField(2)
  late String content;

  @HiveField(3)
  late String description;

  @HiveField(4)
  late String image;

  @HiveField(5)
  late bool isFavourite;

  @HiveField(6)
  late String source;

  NewsLocalEntity(
      {required this.id,
      required this.content,
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
        id: 0,
        content: newsArticleEntity.content,
        description: newsArticleEntity.description,
        title: newsArticleEntity.title,
        source: newsArticleEntity.source,
        image: newsArticleEntity.image,
        isFavourite: newsArticleEntity.isFavourite);
  }
}
