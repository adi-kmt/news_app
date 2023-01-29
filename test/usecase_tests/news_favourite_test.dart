import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_app/common/domain/no_param.dart';
import 'package:news_app/news_favourites_feature/data/repository/news_favourite_repo_impl.dart';
import 'package:news_app/news_favourites_feature/domain/repository/news_favourite_repository.dart';
import 'package:news_app/news_favourites_feature/domain/usecase/check_if_favourite_news_item.dart';
import 'package:news_app/news_favourites_feature/domain/usecase/get_favourite_news_list.dart';
import 'package:news_app/news_list_feature/domain/model/news_entity.dart';

class NewsFavourtieMock extends Mock implements NewsFavouriteRepositoryImpl {}

final newsList = [
  NewsArticleEntity(
      content: "",
      description: "",
      title: "",
      source: "",
      image: "",
      isFavourite: false),
  NewsArticleEntity(
      content: "",
      description: "",
      title: "",
      source: "",
      image: "",
      isFavourite: false),
];

void main() {
  late final NewsFavouriteRepository newsFavouriteRepositoryMock;
  late final GetFavouriteNewsListUseCase getFavouriteNewsListUseCase;
  late final CheckIfFavouriteNewsItemUseCase checkIfFavouriteNewsItemUseCase;

  setUpAll(() {
    newsFavouriteRepositoryMock = NewsFavourtieMock();
    getFavouriteNewsListUseCase = GetFavouriteNewsListUseCase(
        newsFavouriteRepository: newsFavouriteRepositoryMock);
    checkIfFavouriteNewsItemUseCase = CheckIfFavouriteNewsItemUseCase(
        newsFavouriteRepository: newsFavouriteRepositoryMock);
  });

  test("Check get favourite list usecase", () async {
    when(() => newsFavouriteRepositoryMock.getFavouriteList())
        .thenAnswer((invocation) async => newsList);
    final result = await getFavouriteNewsListUseCase.call(NoParams());
    expect(result, newsList);
  });

  test("Check is favourite list usecase", () async {
    when(() => newsFavouriteRepositoryMock.checkIfFavourite(10))
        .thenAnswer((invocation) async => true);
    final result = await checkIfFavouriteNewsItemUseCase.call(10);
    expect(result, true);
  });
  test("Check is favourite list usecase", () async {
    when(() => newsFavouriteRepositoryMock.checkIfFavourite(10))
        .thenAnswer((invocation) async => false);
    final result = await checkIfFavouriteNewsItemUseCase.call(10);
    expect(result, false);
  });
}
