import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/common/api/response_wrapper.dart';
import 'package:news_app/common/domain/no_param.dart';

import '../../../news_favourites_feature/domain/usecase/add_favourite_news_item.dart';
import '../../../news_favourites_feature/domain/usecase/check_if_favourite_news_item.dart';
import '../../../news_favourites_feature/domain/usecase/remove_favourite_news_item.dart';
import '../../domain/model/news_entity.dart';
import '../../domain/usecase/news_list_usecase.dart';

part 'news_list_state.dart';

class NewsListCubit extends Cubit<NewsListState> {
  late final NewsListUseCase newsListUseCase;
  late final AddFavouriteNewsItemUseCase addFavouriteNewsItemUseCase;
  late final RemoveFavouriteNewsItemUseCase removeFavouriteNewsItemUseCase;
  late final CheckIfFavouriteNewsItemUseCase checkIfFavouriteNewsItemUseCase;

  NewsListCubit(
      {required this.newsListUseCase,
      required this.removeFavouriteNewsItemUseCase,
      required this.addFavouriteNewsItemUseCase,
      required this.checkIfFavouriteNewsItemUseCase})
      : super(NewsListInitial());

  void getNewsList() async {
    emit(NewsListLoading());

    final result = await newsListUseCase.call(NoParams());
    if (result is Success) {
      final newsList = result.data as List<NewsArticleEntity>;
      // final checkedNewsList =
      //     newsList.map((newsItem) async => await checkifFavourite(newsItem));
      emit(NewsListReady(newsArticleEntityList: newsList));
    } else if (result is Failure) {
      emit(NewsListFailure(errorMessage: result.error));
    }
  }

  void addNewsToFavourite(NewsArticleEntity newsArticleEntity) async {
    emit(NewsListLoading());
    await addFavouriteNewsItemUseCase.call(newsArticleEntity);
    emit(const NewsListReady(newsArticleEntityList: []));
  }

  void removeNewsFromFavourite(String newsTitle) async {
    emit(NewsListLoading());
    await removeFavouriteNewsItemUseCase.call(newsTitle);
    emit(const NewsListReady(newsArticleEntityList: []));
  }

// Future<NewsArticleEntity> checkifFavourite(
//     NewsArticleEntity newsArticleEntity) async {
//   final isFavourite =
//       await checkIfFavouriteNewsItemUseCase.call(newsArticleEntity);
//   newsArticleEntity.deepCopy(
//       content: newsArticleEntity.content,
//       description: newsArticleEntity.description,
//       title: newsArticleEntity.title,
//       source: newsArticleEntity.source,
//       image: newsArticleEntity.image,
//       isFavourite: isFavourite);
//   return newsArticleEntity;
// }
}
