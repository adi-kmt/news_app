import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_app/news_favourites_feature/data/local/entity/news_article_entity.dart';
import 'package:news_app/news_favourites_feature/data/local/hivie_init.dart';
import 'package:news_app/news_favourites_feature/data/local/news_favourite_local_source.dart';

class HiveInitMock extends Mock implements HiveInit {}

class MockHiveBox extends Mock implements Box {}

final NewsLocalEntity savableNewsEntity = NewsLocalEntity(
    content: "AA",
    description: "AAAAA",
    title: "aaaa",
    source: "abc",
    image: "image",
    isFavourite: false);

void main() {
  late final HiveInit hiveInit;
  late final Box mockHiveBox;
  late final NewsFavouriteLocalSource newsFavouriteLocalSource;

  setUpAll(() {
    hiveInit = HiveInitMock();
    mockHiveBox = MockHiveBox();
    newsFavouriteLocalSource = NewsFavouriteLocalSource(hiveBox: hiveInit);
  });

  test("Check if local source is caching accurately", () async {
    when(() => hiveInit.openBox(any()))
        .thenAnswer((invocation) async => mockHiveBox);
    when(() => mockHiveBox.put(savableNewsEntity.title, savableNewsEntity))
        .thenAnswer((invocation) async => savableNewsEntity);
    await newsFavouriteLocalSource.saveMovie(savableNewsEntity);
    verify(() => hiveInit.openBox(any()));
    verify(() => mockHiveBox.put(savableNewsEntity.title, savableNewsEntity));
  });

  test("Check if local source returns news item", () async {
    when(() => hiveInit.openBox(any()))
        .thenAnswer((invocation) async => mockHiveBox);
    when(() => mockHiveBox.get(savableNewsEntity.title))
        .thenAnswer((invocation) async => savableNewsEntity);
    final result = await newsFavouriteLocalSource
        .checkIfFavourite(savableNewsEntity.title);
    verify(() => mockHiveBox.get(savableNewsEntity.title));
    expect(result, true);
  });
}
