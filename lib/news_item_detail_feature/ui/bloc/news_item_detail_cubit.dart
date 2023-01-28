import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../news_list_feature/domain/model/news_entity.dart';

part 'news_item_detail_state.dart';

class NewsItemDetailCubit extends Cubit<NewsItemDetailState> {
  late final NewsArticleEntity articleEntity;

  NewsItemDetailCubit() : super(NewsItemDetailInitial());
}
