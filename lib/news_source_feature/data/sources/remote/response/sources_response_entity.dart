import 'package:news_app/generated/json/base/json_field.dart';
import 'package:news_app/generated/json/sources_response_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class SourcesResponse {
  String? status;
  List<SourcesResponseSources>? sources;

  SourcesResponse();

  factory SourcesResponse.fromJson(Map<String, dynamic> json) =>
      $SourcesResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => $SourcesResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class SourcesResponseSources {
  String? id;
  String? name;
  String? description;
  String? url;
  String? category;
  String? language;
  String? country;

  SourcesResponseSources();

  factory SourcesResponseSources.fromJson(Map<String, dynamic> json) =>
      $SourcesResponseSourcesFromJson(json);

  Map<String, dynamic> toJson() => $SourcesResponseSourcesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
