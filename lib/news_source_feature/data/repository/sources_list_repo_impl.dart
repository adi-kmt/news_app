import 'package:news_app/common/api/response_wrapper.dart';
import 'package:news_app/news_source_feature/data/sources/remote/sources_list_remote_source.dart';
import 'package:news_app/news_source_feature/domain/repository/source_list_repo.dart';

class SourcesListRepositoryImpl implements SourceListRepository {
  late final SourcesListRemoteSource sourcesListRemoteSource;

  SourcesListRepositoryImpl({required this.sourcesListRemoteSource});

  @override
  Future<ResponseWrapper> getSourcesList() async {
    return await sourcesListRemoteSource.getSourcesList();
  }
}
