import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_app/common/api/response_wrapper.dart';
import 'package:news_app/common/domain/no_param.dart';
import 'package:news_app/news_favourites_feature/domain/usecase/add_favourite_news_item.dart';
import 'package:news_app/news_favourites_feature/domain/usecase/get_favourite_news_list.dart';
import 'package:news_app/news_favourites_feature/domain/usecase/remove_favourite_news_item.dart';
import 'package:news_app/news_list_feature/domain/model/news_entity.dart';
import 'package:news_app/news_list_feature/domain/usecase/news_list_usecase.dart';
import 'package:news_app/news_list_feature/ui/bloc/news_list_cubit.dart';

import '../usecase_tests/news_favourite_test.dart';

class AddFavouriteNewsItemMock extends Mock
    implements AddFavouriteNewsItemUseCase {}

class RemoveFavouriteNewsItemMock extends Mock
    implements RemoveFavouriteNewsItemUseCase {}

class GetFavouriteNewsListMock extends Mock
    implements GetFavouriteNewsListUseCase {}

class GetNewsListMock extends Mock implements NewsListUseCase {}

final newsAdded = [
  NewsArticleEntity(
      content: 'aaa',
      description: "abc",
      title: "abcd",
      source: "abcd",
      image: "aaaa",
      isFavourite: false),
  NewsArticleEntity(
      content: 'aaa',
      description: "abc",
      title: "abcd",
      source: "abcd",
      image: "aaaa",
      isFavourite: true),
  NewsArticleEntity(
      content: 'aab',
      description: "ac",
      title: "abd",
      source: "bcd",
      image: "aaa",
      isFavourite: false),
];

final truthy = newsAdded[0].deepCopy(
    content: newsAdded[0].content,
    description: newsAdded[0].description,
    title: newsAdded[0].title,
    source: newsAdded[0].source,
    image: newsAdded[0].image,
    isFavourite: !newsAdded[0].isFavourite);

void main() {
  late final NewsListUseCase newsListUseCase;
  late final AddFavouriteNewsItemUseCase addFavouriteNewsItemUseCase;
  late final RemoveFavouriteNewsItemUseCase removeFavouriteNewsItemUseCase;
  late final GetFavouriteNewsListUseCase getFavouriteNewsListUseCase;
  late final NewsListCubit newsListCubit;

  setUpAll(() {
    newsListUseCase = GetNewsListMock();
    addFavouriteNewsItemUseCase = AddFavouriteNewsItemMock();
    removeFavouriteNewsItemUseCase = RemoveFavouriteNewsItemMock();
    getFavouriteNewsListUseCase = GetFavouriteNewsListMock();
    newsListCubit = NewsListCubit(
        newsListUseCase: newsListUseCase,
        removeFavouriteNewsItemUseCase: removeFavouriteNewsItemUseCase,
        addFavouriteNewsItemUseCase: addFavouriteNewsItemUseCase,
        getFavouriteNewsListUseCase: getFavouriteNewsListUseCase);
  });

  void returnVoid() {
    return;
  }

  test("Check original state", () {
    expect(newsListCubit.state, NewsListInitial());
  });

  blocTest("Check get List success",
      build: () => newsListCubit,
      setUp: () async {
        when(() => newsListUseCase.call(NoParams()))
            .thenAnswer((invocation) async => Success(data: newsList));
      },
      act: (cubit) => cubit.getNewsList(),
      expect: () => <NewsListState>[
            NewsListLoading(),
            NewsListReady(newsArticleEntityList: newsList)
          ]);

  blocTest("Check get List failure",
      build: () => newsListCubit,
      setUp: () async {
        when(() => newsListUseCase.call(NoParams())).thenAnswer(
            (invocation) async => Failure(error: Exception("Api error")));
      },
      act: (cubit) => cubit.getNewsList(),
      expect: () => <NewsListState>[
            NewsListLoading(),
            NewsListFailure(errorMessage: Exception("Api error"))
          ]);

  blocTest("Add favourite, Success list from get list",
      build: () => newsListCubit,
      setUp: () async {
        when(() => addFavouriteNewsItemUseCase.call(truthy))
            .thenAnswer((_) async => returnVoid());
        when(() => getFavouriteNewsListUseCase.call(NoParams()))
            .thenAnswer((_) async => [truthy]);
        when(() => newsListUseCase.call(NoParams()))
            .thenAnswer((_) async => Success(data: [newsAdded[2]]));
      },
      act: (cubit) async => cubit.addNewsToFavourite(newsAdded[0]),
      expect: () => <NewsListState>[
            NewsListLoading(),
            NewsListFavouriteAdded(newsArticleEntity: truthy),
            NewsListLoading(),
            NewsListReady(newsArticleEntityList: [truthy, newsAdded[2]])
          ]);

  //TODO test case not working
  blocTest("Add favourite, failure from get list",
      build: () => newsListCubit,
      setUp: () {
        when(() => newsListUseCase.call(NoParams()))
            .thenAnswer((_) async => Failure(error: Exception("Failed API")));
        when(() => addFavouriteNewsItemUseCase.call(newsAdded[0]))
            .thenAnswer((_) async => returnVoid());
        when(() => getFavouriteNewsListUseCase.call(NoParams()))
            .thenAnswer((_) async => [newsAdded[0]]);
      },
      act: (cubit) => cubit.addNewsToFavourite(newsAdded[0]),
      expect: () => <NewsListState>[
            NewsListLoading(),
            NewsListFavouriteAdded(newsArticleEntity: newsAdded[0]),
            NewsListLoading(),
            NewsListReady(newsArticleEntityList: [newsAdded[0]])
          ]);

  blocTest("Remove favourite, Success list from get list",
      build: () => newsListCubit,
      setUp: () async {
        when(() => getFavouriteNewsListUseCase.call(NoParams()))
            .thenAnswer((_) async => [newsAdded[2]]);
        when(() => removeFavouriteNewsItemUseCase.call(newsAdded[1].title))
            .thenAnswer((_) async => returnVoid());
        when(() => newsListUseCase.call(NoParams()))
            .thenAnswer((_) async => Success(data: [newsAdded[2]]));
      },
      act: (cubit) async => cubit.removeNewsFromFavourite(newsAdded[1]),
      expect: () => <NewsListState>[
            NewsListLoading(),
            NewsListFavouriteRemoved(
                newsArticleEntityTitle: newsAdded[1].title),
            NewsListLoading(),
            NewsListReady(newsArticleEntityList: [newsAdded[2]])
          ]);

  blocTest("Remove favourite, failure from get list",
      build: () => newsListCubit,
      setUp: () async {
        when(() => getFavouriteNewsListUseCase.call(NoParams()))
            .thenAnswer((_) async => [newsAdded[2]]);
        when(() => removeFavouriteNewsItemUseCase.call(newsAdded[1].title))
            .thenAnswer((_) async => returnVoid());
        when(() => newsListUseCase.call(NoParams())).thenAnswer(
            (_) async => Failure(error: Exception("Random exception")));
      },
      act: (cubit) async => cubit.removeNewsFromFavourite(newsAdded[1]),
      expect: () => <NewsListState>[
            NewsListLoading(),
            NewsListFavouriteRemoved(
                newsArticleEntityTitle: newsAdded[1].title),
            NewsListLoading(),
            NewsListReady(newsArticleEntityList: [newsAdded[2]])
          ]);
}
