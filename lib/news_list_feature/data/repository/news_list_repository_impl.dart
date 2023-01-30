import 'package:news_app/common/api/response_wrapper.dart';
import 'package:news_app/news_list_feature/data/sources/remote/news_list_remote_source.dart';
import 'package:news_app/news_list_feature/domain/repository/news_list_repo.dart';

class NewsListRepositoryImpl implements NewsListRepository {
  late final NewsListRemoteSource newsListRemoteSource;

  NewsListRepositoryImpl({required this.newsListRemoteSource});

  @override
  Future<ResponseWrapper> getNewsList() async {
    return await newsListRemoteSource.getNewsList();
  }
}
