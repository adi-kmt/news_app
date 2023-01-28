import 'package:news_app/common/api/response_wrapper.dart';
import 'package:news_app/common/domain/base_usecase.dart';
import 'package:news_app/common/domain/no_param.dart';
import 'package:news_app/news_source_feature/domain/repository/source_list_repo.dart';

class SourcesListUsecase implements BaseUseCase<List, NoParams> {
  late final SourceListRepository sourceListRepository;

  SourcesListUsecase({required this.sourceListRepository});

  @override
  Future<ResponseWrapper> call(NoParams noParams) async {
    return await sourceListRepository.getSourcesList();
  }
}
