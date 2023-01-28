part of 'news_source_list_cubit.dart';

abstract class NewsSourceListState extends Equatable {
  const NewsSourceListState();

  @override
  List<Object> get props => [];
}

class NewsSourceListInitial extends NewsSourceListState {}

class NewsSourcesListLoading extends NewsSourceListState {}

class NewsSourcesListFailed extends NewsSourceListState {
  final Exception errorMessage;

  const NewsSourcesListFailed({required this.errorMessage});

  @override
  get props => [errorMessage.toString()];
}

class NewsSourcesListReady extends NewsSourceListState {
  final List<NewsSourceEntity> sourceList;

  const NewsSourcesListReady({required this.sourceList});

  @override
  get props => [
        sourceList.map((e) => e.name),
        sourceList.map((e) => e.country),
        sourceList.map((e) => e.language)
      ];
}
