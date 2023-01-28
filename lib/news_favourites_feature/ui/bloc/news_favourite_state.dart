part of 'news_favourite_cubit.dart';

abstract class NewsFavouriteState extends Equatable {
  const NewsFavouriteState();

  @override
  List<Object> get props => [];
}

class NewsFavouriteInitial extends NewsFavouriteState {}

class NewsFavouriteLoading extends NewsFavouriteState {}

class NewsFavouriteReady extends NewsFavouriteState {
  final List<NewsArticleEntity> newsArticleEntityList;

  const NewsFavouriteReady({required this.newsArticleEntityList});

  @override
  List<Object> get props => [
        newsArticleEntityList.map((e) => e.title),
        newsArticleEntityList.map((e) => e.source),
        newsArticleEntityList.map((e) => e.isFavourite)
      ];
}

class NewsFavouriteFailed extends NewsFavouriteState {
  final Exception errorMessage;

  const NewsFavouriteFailed({required this.errorMessage});

  @override
  get props => [errorMessage.toString()];
}
