import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../common/api/response_wrapper.dart';
import '../../../common/domain/no_param.dart';
import '../../../news_list_feature/domain/model/news_entity.dart';
import '../../domain/usecase/add_favourite_news_item.dart';
import '../../domain/usecase/get_favourite_news_list.dart';
import '../../domain/usecase/remove_favourite_news_item.dart';

part 'news_favourite_state.dart';

class NewsFavouriteCubit extends Cubit<NewsFavouriteState> {
  late final AddFavouriteNewsItemUseCase addFavouriteNewsItemUseCase;
  late final RemoveFavouriteNewsItemUseCase removeFavouriteNewsItemUseCase;
  late final GetFavouriteNewsListUseCase getFavouriteNewsListUseCase;

  NewsFavouriteCubit(
      {required this.getFavouriteNewsListUseCase,
      required this.removeFavouriteNewsItemUseCase,
      required this.addFavouriteNewsItemUseCase})
      : super(NewsFavouriteInitial());

  void getFavouriteNewsItem() async {
    emit(NewsFavouriteLoading());

    final result = await getFavouriteNewsListUseCase.call(NoParams());
    if (result is Success) {
      final newsList = result as List<NewsArticleEntity>;
      // final checkedNewsList =
      //     newsList.map((newsItem) async => await checkifFavourite(newsItem));
      emit(NewsFavouriteReady(newsArticleEntityList: newsList));
    } else if (result is Failure) {
      emit(NewsFavouriteFailed(
          errorMessage: Exception("Failed to get favourite items")));
    }
  }

  Future<void> addFavouriteNewsItem(NewsArticleEntity newsArticleEntity) async {
    emit(NewsFavouriteLoading());
    await addFavouriteNewsItemUseCase.call(newsArticleEntity);
    emit(NewsFavouriteAdded());
  }

  void removeFavouriteNewsItem(int newsId) async {
    emit(NewsFavouriteLoading());
    await removeFavouriteNewsItemUseCase.call(newsId);
    emit(NewsFavouriteRemoved());
  }
}
