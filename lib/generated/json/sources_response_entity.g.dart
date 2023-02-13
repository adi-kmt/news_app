import 'package:news_app/generated/json/base/json_convert_content.dart';
import 'package:news_app/news_source_feature/data/sources/remote/response/sources_response_entity.dart';

SourcesResponse $SourcesResponseEntityFromJson(Map<String, dynamic> json) {
  final SourcesResponse sourcesResponseEntity = SourcesResponse();
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    sourcesResponseEntity.status = status;
  }
  final List<SourcesResponseSources>? sources =
      jsonConvert.convertListNotNull<SourcesResponseSources>(json['sources']);
  if (sources != null) {
    sourcesResponseEntity.sources = sources;
  }
  return sourcesResponseEntity;
}

Map<String, dynamic> $SourcesResponseEntityToJson(SourcesResponse entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = entity.status;
  data['sources'] = entity.sources?.map((v) => v.toJson()).toList();
  return data;
}

SourcesResponseSources $SourcesResponseSourcesFromJson(
    Map<String, dynamic> json) {
  final SourcesResponseSources sourcesResponseSources =
      SourcesResponseSources();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    sourcesResponseSources.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    sourcesResponseSources.name = name;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    sourcesResponseSources.description = description;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    sourcesResponseSources.url = url;
  }
  final String? category = jsonConvert.convert<String>(json['category']);
  if (category != null) {
    sourcesResponseSources.category = category;
  }
  final String? language = jsonConvert.convert<String>(json['language']);
  if (language != null) {
    sourcesResponseSources.language = language;
  }
  final String? country = jsonConvert.convert<String>(json['country']);
  if (country != null) {
    sourcesResponseSources.country = country;
  }
  return sourcesResponseSources;
}

Map<String, dynamic> $SourcesResponseSourcesToJson(
    SourcesResponseSources entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['description'] = entity.description;
  data['url'] = entity.url;
  data['category'] = entity.category;
  data['language'] = entity.language;
  data['country'] = entity.country;
  return data;
}
