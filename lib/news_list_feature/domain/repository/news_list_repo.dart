import '../../../common/api/response_wrapper.dart';

abstract class NewsListRepository {
  Future<ResponseWrapper<dynamic>> getNewsList();
}
