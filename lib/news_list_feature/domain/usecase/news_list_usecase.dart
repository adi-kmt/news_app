import 'package:news_app/common/api/response_wrapper.dart';
import 'package:news_app/common/domain/base_usecase.dart';
import 'package:news_app/common/domain/no_param.dart';
import 'package:news_app/news_list_feature/domain/repository/news_list_repo.dart';

class NewsListUseCase implements BaseUseCase<List, NoParams> {
  late final NewsListRepository newsListRepository;

  NewsListUseCase({required this.newsListRepository});

  @override
  Future<ResponseWrapper> call(NoParams noParams) async {
    return await newsListRepository.getNewsList();
  }
}
