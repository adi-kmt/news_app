part of 'news_list_cubit.dart';

abstract class NewsListState extends Equatable {
  const NewsListState();

  @override
  List<Object> get props => [];
}

class NewsListInitial extends NewsListState {}

class NewsListLoading extends NewsListState {}

class NewsListFavouriteAdded extends NewsListState {
  final NewsArticleEntity newsArticleEntity;

  const NewsListFavouriteAdded({required this.newsArticleEntity});

  @override
  List<Object> get props => [newsArticleEntity.title];
}

class NewsListFavouriteRemoved extends NewsListState {
  final String newsArticleEntityTitle;

  const NewsListFavouriteRemoved({required this.newsArticleEntityTitle});

  @override
  List<Object> get props => [newsArticleEntityTitle];
}

class NewsListReady extends NewsListState {
  final List<NewsArticleEntity> newsArticleEntityList;

  const NewsListReady({required this.newsArticleEntityList});

  @override
  List<Object> get props => [
        newsArticleEntityList.map((e) => e.title),
        newsArticleEntityList.map((e) => e.source),
        newsArticleEntityList.map((e) => e.isFavourite)
      ];
}

class NewsListFailure extends NewsListState {
  final Exception errorMessage;

  const NewsListFailure({required this.errorMessage});

  @override
  get props => [errorMessage.toString()];
}
