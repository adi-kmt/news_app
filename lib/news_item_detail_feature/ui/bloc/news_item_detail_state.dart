part of 'news_item_detail_cubit.dart';

@immutable
abstract class NewsItemDetailState extends Equatable {
  const NewsItemDetailState();
}

class NewsItemDetailInitial extends NewsItemDetailState {
  @override
  List<Object> get props => [];
}
