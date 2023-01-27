import '../../data/sources/remote/response/sources_response_entity.dart';

class NewsSourceEntity {
  late String name;
  late String language;
  late String country;

  NewsSourceEntity({
    required this.name,
    required this.language,
    required this.country,
  });
}

extension NewsSourceResponseExtension on SourcesResponseSources {
  NewsSourceEntity get getNewsSourceEntity => NewsSourceEntity(
      name: this.name ?? "",
      language: this.language ?? "",
      country: this.country ?? "");
}
