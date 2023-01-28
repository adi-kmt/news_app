import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/usecase/news_list_usecase.dart';

part 'news_list_state.dart';

class NewsListCubit extends Cubit<NewsListState> {
  late final NewsListUseCase newsListUseCase;

  NewsListCubit({required this.newsListUseCase}) : super(NewsListInitial());
}
