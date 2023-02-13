import 'package:news_app/generated/json/base/json_field.dart';
import 'package:news_app/generated/json/article_response_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class ArticleResponse {
  String? status;
  int? totalResults;
  List<ArticleResponseArticles>? articles;

  ArticleResponse();

  factory ArticleResponse.fromJson(Map<String, dynamic> json) =>
      $ArticleResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => $ArticleResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ArticleResponseArticles {
  @JSONField(name: "source")
  ArticleResponseArticlesSource? xSource;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  ArticleResponseArticles();

  factory ArticleResponseArticles.fromJson(Map<String, dynamic> json) =>
      $ArticleResponseArticlesFromJson(json);

  Map<String, dynamic> toJson() => $ArticleResponseArticlesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ArticleResponseArticlesSource {
  String? id;
  String? name;

  ArticleResponseArticlesSource();

  factory ArticleResponseArticlesSource.fromJson(Map<String, dynamic> json) =>
      $ArticleResponseArticlesSourceFromJson(json);

  Map<String, dynamic> toJson() => $ArticleResponseArticlesSourceToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
