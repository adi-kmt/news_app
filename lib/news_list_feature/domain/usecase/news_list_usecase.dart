import 'package:news_app/common/api/response_wrapper.dart';
import 'package:news_app/news_list_feature/domain/repository/news_list_repo.dart';

class NewsListUseCase {
  late final NewsListRepository newsListRepository;

  NewsListUseCase({required this.newsListRepository});

  @override
  Future<ResponseWrapper> call() async {
    return await newsListRepository.getNewsList();
  }
}
