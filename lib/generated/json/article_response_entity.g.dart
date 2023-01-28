import 'package:news_app/generated/json/base/json_convert_content.dart';
import 'package:news_app/news_list_feature/data/sources/remote/response/article_response_entity.dart';

ArticleResponse $ArticleResponseEntityFromJson(Map<String, dynamic> json) {
  final ArticleResponse articleResponseEntity = ArticleResponse();
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    articleResponseEntity.status = status;
  }
  final int? totalResults = jsonConvert.convert<int>(json['totalResults']);
  if (totalResults != null) {
    articleResponseEntity.totalResults = totalResults;
  }
  final List<ArticleResponseArticles>? articles =
      jsonConvert.convertListNotNull<ArticleResponseArticles>(json['articles']);
  if (articles != null) {
    articleResponseEntity.articles = articles;
  }
  return articleResponseEntity;
}

Map<String, dynamic> $ArticleResponseEntityToJson(ArticleResponse entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = entity.status;
  data['totalResults'] = entity.totalResults;
  data['articles'] = entity.articles?.map((v) => v.toJson()).toList();
  return data;
}

ArticleResponseArticles $ArticleResponseArticlesFromJson(
    Map<String, dynamic> json) {
  final ArticleResponseArticles articleResponseArticles =
      ArticleResponseArticles();
  final ArticleResponseArticlesSource? xSource =
      jsonConvert.convert<ArticleResponseArticlesSource>(json['source']);
  if (xSource != null) {
    articleResponseArticles.xSource = xSource;
  }
  final String? author = jsonConvert.convert<String>(json['author']);
  if (author != null) {
    articleResponseArticles.author = author;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    articleResponseArticles.title = title;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    articleResponseArticles.description = description;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    articleResponseArticles.url = url;
  }
  final String? urlToImage = jsonConvert.convert<String>(json['urlToImage']);
  if (urlToImage != null) {
    articleResponseArticles.urlToImage = urlToImage;
  }
  final String? publishedAt = jsonConvert.convert<String>(json['publishedAt']);
  if (publishedAt != null) {
    articleResponseArticles.publishedAt = publishedAt;
  }
  final String? content = jsonConvert.convert<String>(json['content']);
  if (content != null) {
    articleResponseArticles.content = content;
  }
  return articleResponseArticles;
}

Map<String, dynamic> $ArticleResponseArticlesToJson(
    ArticleResponseArticles entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['source'] = entity.xSource?.toJson();
  data['author'] = entity.author;
  data['title'] = entity.title;
  data['description'] = entity.description;
  data['url'] = entity.url;
  data['urlToImage'] = entity.urlToImage;
  data['publishedAt'] = entity.publishedAt;
  data['content'] = entity.content;
  return data;
}

ArticleResponseArticlesSource $ArticleResponseArticlesSourceFromJson(
    Map<String, dynamic> json) {
  final ArticleResponseArticlesSource articleResponseArticlesSource =
      ArticleResponseArticlesSource();
  final dynamic? id = jsonConvert.convert<dynamic>(json['id']);
  if (id != null) {
    articleResponseArticlesSource.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    articleResponseArticlesSource.name = name;
  }
  return articleResponseArticlesSource;
}

Map<String, dynamic> $ArticleResponseArticlesSourceToJson(
    ArticleResponseArticlesSource entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  return data;
}
