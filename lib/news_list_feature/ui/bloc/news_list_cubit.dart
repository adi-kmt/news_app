import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/common/api/response_wrapper.dart';
import 'package:news_app/common/domain/no_param.dart';

import '../../../news_favourites_feature/domain/usecase/add_favourite_news_item.dart';
import '../../../news_favourites_feature/domain/usecase/get_favourite_news_list.dart';
import '../../../news_favourites_feature/domain/usecase/remove_favourite_news_item.dart';
import '../../domain/model/news_entity.dart';
import '../../domain/usecase/news_list_usecase.dart';

part 'news_list_state.dart';

class NewsListCubit extends Cubit<NewsListState> {
  late final NewsListUseCase newsListUseCase;
  late final AddFavouriteNewsItemUseCase addFavouriteNewsItemUseCase;
  late final RemoveFavouriteNewsItemUseCase removeFavouriteNewsItemUseCase;
  late final GetFavouriteNewsListUseCase getFavouriteNewsListUseCase;

  NewsListCubit(
      {required this.newsListUseCase,
      required this.removeFavouriteNewsItemUseCase,
      required this.addFavouriteNewsItemUseCase,
      required this.getFavouriteNewsListUseCase})
      : super(NewsListInitial()) {
    getNewsList();
  }

  void getNewsList() async {
    emit(NewsListLoading());
    final result = await newsListUseCase.call(NoParams());
    if (result is Success) {
      final newsList = result.data as List<NewsArticleEntity>;
      emit(NewsListReady(newsArticleEntityList: newsList));
    } else if (result is Failure) {
      emit(NewsListFailure(errorMessage: result.error));
    }
  }

  void addNewsToFavourite(NewsArticleEntity newsArticleEntity) async {
    emit(NewsListLoading());
    await addFavouriteNewsItemUseCase.call(newsArticleEntity);
    emit(NewsListFavouriteAdded(newsArticleEntity: newsArticleEntity));
    appendFavouriteItems();
  }

  void removeNewsFromFavourite(String newsTitle) async {
    emit(NewsListLoading());
    await removeFavouriteNewsItemUseCase.call(newsTitle);
    emit(NewsListFavouriteRemoved(newsArticleEntityTitle: newsTitle));
    appendFavouriteItems();
  }

  void appendFavouriteItems() async {
    List<NewsArticleEntity> newsList = [];
    emit(NewsListLoading());
    final favNewsItems =
        await getFavouriteNewsListUseCase.call(NoParams()) ?? [];
    final result = await newsListUseCase.call(NoParams());
    if (result is Success) {
      newsList = result.data as List<NewsArticleEntity>;
      newsList.removeWhere((element) => favNewsItems.contains(element));
    }

    favNewsItems.forEach((element) {
      newsList.add(element);
    });
    emit(NewsListReady(newsArticleEntityList: newsList));
  }
}
