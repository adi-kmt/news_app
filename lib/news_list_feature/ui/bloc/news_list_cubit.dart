import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../news_favourites_feature/domain/usecase/add_favourite_news_item.dart';
import '../../../news_favourites_feature/domain/usecase/remove_favourite_news_item.dart';
import '../../domain/model/news_entity.dart';
import '../../domain/usecase/news_list_usecase.dart';

part 'news_list_state.dart';

class NewsListCubit extends Cubit<NewsListState> {
  late final NewsListUseCase newsListUseCase;
  late final AddFavouriteNewsItemUseCase addFavouriteNewsItemUseCase;
  late final RemoveFavouriteNewsItemUseCase removeFavouriteNewsItemUseCase;

  NewsListCubit(
      {required this.newsListUseCase,
      required this.removeFavouriteNewsItemUseCase,
      required this.addFavouriteNewsItemUseCase})
      : super(NewsListInitial());

  void getNewsList() {}

  void addNewsToFavourite() {}

  void removeNewsFromFavourite() {}
}
