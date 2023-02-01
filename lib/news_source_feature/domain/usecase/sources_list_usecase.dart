import 'package:news_app/common/api/response_wrapper.dart';
import 'package:news_app/news_source_feature/domain/repository/source_list_repo.dart';

class SourcesListUsecase {
  late final SourceListRepository sourceListRepository;

  SourcesListUsecase({required this.sourceListRepository});

  @override
  Future<ResponseWrapper> call() async {
    return await sourceListRepository.getSourcesList();
  }
}
