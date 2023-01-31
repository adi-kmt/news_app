import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_app/common/domain/no_param.dart';
import 'package:news_app/news_favourites_feature/domain/usecase/add_favourite_news_item.dart';
import 'package:news_app/news_favourites_feature/domain/usecase/get_favourite_news_list.dart';
import 'package:news_app/news_favourites_feature/domain/usecase/remove_favourite_news_item.dart';
import 'package:news_app/news_favourites_feature/ui/bloc/news_favourite_cubit.dart';
import 'package:news_app/news_source_feature/domain/model/news_source_entity.dart';

import '../usecase_tests/news_favourite_test.dart';

class AddFavouriteNewsItemMock extends Mock
    implements AddFavouriteNewsItemUseCase {}

class RemoveFavouriteNewsItemMock extends Mock
    implements RemoveFavouriteNewsItemUseCase {}

class GetFavouriteNewsListMock extends Mock
    implements GetFavouriteNewsListUseCase {}

final news = [
  NewsSourceEntity(name: "abcd", language: "abc", country: "efg"),
  NewsSourceEntity(name: "abc", language: "acb", country: "egf"),
];

void main() {
  late final AddFavouriteNewsItemUseCase addFavouriteNewsItemUseCase;
  late final RemoveFavouriteNewsItemUseCase removeFavouriteNewsItemUseCase;
  late final GetFavouriteNewsListUseCase getFavouriteNewsListUseCase;
  late final NewsFavouriteCubit newsFavouriteCubit;

  setUpAll(() {
    addFavouriteNewsItemUseCase = AddFavouriteNewsItemMock();
    removeFavouriteNewsItemUseCase = RemoveFavouriteNewsItemMock();
    getFavouriteNewsListUseCase = GetFavouriteNewsListMock();
    newsFavouriteCubit = NewsFavouriteCubit(
        addFavouriteNewsItemUseCase: addFavouriteNewsItemUseCase,
        removeFavouriteNewsItemUseCase: removeFavouriteNewsItemUseCase,
        getFavouriteNewsListUseCase: getFavouriteNewsListUseCase);
  });

  test("testing initial state", () async {
    expect(newsFavouriteCubit.state, NewsFavouriteInitial());
  });

  blocTest("testing get favourite items success",
      build: () => newsFavouriteCubit,
      setUp: () async {
        when(() => getFavouriteNewsListUseCase.call(NoParams()))
            .thenAnswer((invocation) async => newsList);
      },
      act: (cubit) => cubit.getFavouriteNewsItem(),
      expect: () => <NewsFavouriteState>[
            NewsFavouriteLoading(),
            NewsFavouriteReady(newsArticleEntityList: newsList)
          ]);

  blocTest("testing get favourite items failed",
      build: () => newsFavouriteCubit,
      setUp: () async {
        when(() => getFavouriteNewsListUseCase.call(NoParams()))
            .thenAnswer((invocation) async => []);
      },
      act: (cubit) => cubit.getFavouriteNewsItem(),
      expect: () => <NewsFavouriteState>[
            NewsFavouriteLoading(),
            NewsFavouriteFailed(
                errorMessage: Exception("Failed to get favourite items"))
          ]);
}
