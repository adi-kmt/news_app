import 'package:news_app/api_key.dart';
import 'package:news_app/common/api/api_client.dart';
import 'package:news_app/common/api/api_exception_wrapper.dart';
import 'package:news_app/common/api/response_wrapper.dart';
import 'package:news_app/news_list_feature/data/sources/remote/response/article_response_entity.dart';
import 'package:news_app/news_list_feature/domain/model/news_entity.dart';
import 'package:news_app/utils/api_utils.dart';
import 'package:news_app/utils/number_utils.dart';

class NewsListRemoteSource {
  late final ApiClient apiClient;

  NewsListRemoteSource({required this.apiClient});

  Future<ResponseWrapper> getNewsList() async {
    try {
      final response =
          await apiClient.get(ApiUtils.topHeadlinesEndpoint, queryParameters: {
        ApiUtils.topHeadlineRequiredCountryParameterKey:
            ApiUtils.topHeadlineRequiredCountryParameterValue,
        ApiUtils.apiKeyParameterKey: ApiKey.apiKey,
        ApiUtils.pageSizeParameterKey: ApiUtils.maxNoArticlesParameterValue
      });
      if (response.statusCode == 200) {
        final newsListResponse = ArticleResponse.fromJson(response.data);
        return Success(
            data: newsListResponse.articles
                ?.map((article) => article.getArticleEntity)
                .toList());
      } else {
        return Failure(
            error: APIException(
                response.statusMessage ?? ApiUtils.genericApiErrorMessage,
                response.statusCode ?? NumberUtils.standardServerError));
      }
    } on Exception catch (e, _) {
      return Failure(error: e);
    }
  }
}
