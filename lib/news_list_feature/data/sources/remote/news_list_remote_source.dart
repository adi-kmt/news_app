import 'package:dio/dio.dart';
import 'package:news_app/api_key.dart';
import 'package:news_app/common/api/api_client.dart';
import 'package:news_app/common/api/api_exception_wrapper.dart';
import 'package:news_app/common/api/response_wrapper.dart';
import 'package:news_app/news_list_feature/data/sources/remote/response/articles_response.dart';
import 'package:news_app/news_list_feature/data/sources/remote/response/news_list_remote_response.dart';
import 'package:news_app/utils/api_utils.dart';
import 'package:news_app/utils/number_utils.dart';
import 'package:news_app/utils/string_utils.dart';

class NewsListRemoteSource {
  late final ApiClient apiClient;

  NewsListRemoteSource({required this.apiClient});

  Future<ResponseWrapper> getNewsList() async {
    try {
      final response = await apiClient.get(ApiUtils.topHeadlinesEndpoint,
          queryParameters: {
            'country': ApiUtils.topHeadlineRequiredCountryParameter,
            'apiKey': ApiKey.apiKey
          });
      final newsListResponse = NewsListResponse.fromJson(response.data);
      if (newsListResponse.status == "ok") {
        return Success(data: newsListResponse.articles);
      } else {
        return Failure(
            error: APIException(
                response.statusMessage ?? StringUtils.genericApiErrorMessage,
                response.statusCode ?? NumberUtils.standardServerError));
      }
    } on Exception catch (e, _) {
      return Failure(error: e);
    }
  }
}
