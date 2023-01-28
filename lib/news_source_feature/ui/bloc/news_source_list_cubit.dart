import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/common/api/response_wrapper.dart';
import 'package:news_app/common/domain/no_param.dart';
import 'package:news_app/news_source_feature/domain/model/news_source_entity.dart';

import '../../domain/usecase/sources_list_usecase.dart';

part 'news_source_list_state.dart';

class NewsSourceListCubit extends Cubit<NewsSourceListState> {
  late final SourcesListUsecase sourcesListUsecase;

  NewsSourceListCubit({required this.sourcesListUsecase})
      : super(NewsSourceListInitial());

  void getSources() async {
    emit(NewsSourcesListLoading());
    final sourcesResult = await sourcesListUsecase.call(NoParams());
    if (sourcesResult is Success) {
      final data = sourcesResult.data as List<NewsSourceEntity>;
      emit(NewsSourcesListReady(sourceList: data));
    } else if (sourcesResult is Failure) {
      final errorMessage = sourcesResult.error;
      emit(NewsSourcesListFailed(errorMessage: errorMessage));
    }
  }
}
