import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/usecase/sources_list_usecase.dart';

part 'news_source_list_state.dart';

class NewsSourceListCubit extends Cubit<NewsSourceListState> {
  late final SourcesListUsecase sourcesListUsecase;

  NewsSourceListCubit({required this.sourcesListUsecase})
      : super(NewsSourceListInitial());
}
