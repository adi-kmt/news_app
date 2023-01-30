import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

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
    if (result != null) {
      final newsList = result;
      emit(NewsFavouriteReady(newsArticleEntityList: newsList));
    } else {
      emit(NewsFavouriteFailed(
          errorMessage: Exception("Failed to get favourite items")));
    }
  }
}
