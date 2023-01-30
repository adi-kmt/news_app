import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_app/news_favourites_feature/domain/usecase/add_favourite_news_item.dart';
import 'package:news_app/news_favourites_feature/domain/usecase/get_favourite_news_list.dart';
import 'package:news_app/news_favourites_feature/domain/usecase/remove_favourite_news_item.dart';
import 'package:news_app/news_favourites_feature/ui/bloc/news_favourite_cubit.dart';

class AddFavouriteNewsItemMock extends Mock
    implements AddFavouriteNewsItemUseCase {}

class RemoveFavouriteNewsItemMock extends Mock
    implements RemoveFavouriteNewsItemUseCase {}

class GetFavouriteNewsListMock extends Mock
    implements GetFavouriteNewsListUseCase {}

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
}
