import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_app/api_key.dart';
import 'package:news_app/common/api/api_client.dart';
import 'package:news_app/common/api/response_wrapper.dart';
import 'package:news_app/common/di/get_it_module.dart' as get_it;
import 'package:news_app/news_list_feature/data/sources/remote/news_list_remote_source.dart';
import 'package:news_app/news_list_feature/data/sources/remote/response/article_response_entity.dart';
import 'package:news_app/utils/api_utils.dart';

class NewsRemoteSourceMock extends Mock implements NewsListRemoteSource {}

class ApiClientStub extends Mock implements ApiClient {}

void main() {
  late final ApiClient apiClient;
  late final ApiClient apiClientStub;
  late final NewsListRemoteSource newsListRemoteSourceStub;
  late final NewsListRemoteSource newsListRemoteSource;

  setUpAll(() {
    unawaited(get_it.init());
    apiClient = get_it.getItInstance<ApiClient>();
    apiClientStub = ApiClientStub();
    newsListRemoteSource = NewsListRemoteSource(apiClient: apiClientStub);
    newsListRemoteSourceStub = NewsRemoteSourceMock();
  });

  test("Check if data recieved from client", () async {
    final response =
        await apiClient.get(ApiUtils.topHeadlinesEndpoint, queryParameters: {
      ApiUtils.topHeadlineRequiredCountryParameterKey:
          ApiUtils.topHeadlineRequiredCountryParameterValue,
      ApiUtils.apiKeyParameterKey: ApiKey.apiKey,
      ApiUtils.pageSizeParameterKey: ApiUtils.maxNoArticlesParameterValue
    });
    expect(response.statusCode, 200);
  });

  test("Check data in the Json", () async {
    final response =
        await apiClient.get(ApiUtils.topHeadlinesEndpoint, queryParameters: {
      ApiUtils.topHeadlineRequiredCountryParameterKey:
          ApiUtils.topHeadlineRequiredCountryParameterValue,
      ApiUtils.apiKeyParameterKey: ApiKey.apiKey,
      ApiUtils.pageSizeParameterKey: ApiUtils.maxNoArticlesParameterValue
    });
    if (response.statusCode == 200) {
      final newsListResponse = ArticleResponse.fromJson(response.data);
      expect(
          newsListResponse.totalResults, ApiUtils.maxNoArticlesParameterValue);
      expect(newsListResponse.status, "ok");
      expect(response.headers.value("content-type"),
          "application/json; charset=utf-8");
    } else {
      printOnFailure("Data in JSon not as expected");
    }
  });

  /// Mocking the data source to check for correct responses i.e Success and failiure
  test("Mocking success behaviour", () async {
    final ResponseWrapper response = Success(data: []);
    when(() => newsListRemoteSourceStub.getNewsList())
        .thenAnswer((_) async => Future(() => response));
    final responseValue = await newsListRemoteSourceStub.getNewsList();
    final isInstanceOf = responseValue is Success;
    expect(isInstanceOf, true);
  });

  test("Mocking failiure behaviour", () async {
    final ResponseWrapper response =
        Failure(error: Exception("Random APi error"));
    when(() => newsListRemoteSourceStub.getNewsList())
        .thenAnswer((_) async => Future(() => response));
    final responseValue = await newsListRemoteSourceStub.getNewsList();
    final isInstanceOf = responseValue is Failure;
    expect(isInstanceOf, true);
  });

  // test("Mocking Try catch behaviour behaviour", () async {
  //   when(() async {
  //     apiClientStub.get(ApiUtils.topHeadlinesEndpoint, queryParameters: {
  //       ApiUtils.topHeadlineRequiredCountryParameterKey:
  //           ApiUtils.topHeadlineRequiredCountryParameterValue,
  //       ApiUtils.apiKeyParameterKey: ApiKey.apiKey,
  //       ApiUtils.pageSizeParameterKey: ApiUtils.maxNoArticlesParameterValue
  //     });
  //   }).thenReturn(() async => Future(() => Exception("Sample APi error")));
  //   final responseValue = await newsListRemoteSource.getNewsList();
  //   if (responseValue != null) {
  //     final isInstanceOf = responseValue is Failure;
  //     expect(isInstanceOf, true);
  //   } else {
  //     printOnFailure("Test failed");
  //   }
  // });
}
