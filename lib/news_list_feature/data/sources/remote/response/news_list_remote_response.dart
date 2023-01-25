import 'package:json_annotation/json_annotation.dart';
import 'package:news_app/news_list_feature/data/sources/remote/response/articles_response.dart';

@JsonSerializable()
class NewsListResponse {
  String? status;
  int? totalResults;
  List<ArticleResponse>? articles;

  NewsListResponse({this.status, this.totalResults, this.articles});

  NewsListResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = <ArticleResponse>[];
      json['articles'].forEach((v) {
        articles!.add(new ArticleResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['totalResults'] = this.totalResults;
    if (this.articles != null) {
      data['articles'] = this.articles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
