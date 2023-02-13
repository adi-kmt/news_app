import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_app/api_key.dart';
import 'package:news_app/common/api/api_client.dart';
import 'package:news_app/common/api/response_wrapper.dart';
import 'package:news_app/common/di/get_it_module.dart' as get_it;
import 'package:news_app/news_source_feature/data/sources/remote/response/sources_response_entity.dart';
import 'package:news_app/news_source_feature/data/sources/remote/sources_list_remote_source.dart';
import 'package:news_app/utils/api_utils.dart';

class SourceRemoteSourceMock extends Mock implements SourcesListRemoteSource {}

void main() {
  late final ApiClient apiClient;
  late final SourcesListRemoteSource sourcesListRemoteSourceStub;

  setUpAll(() async {
    unawaited(get_it.init());
    apiClient = get_it.getItInstance<ApiClient>();
    sourcesListRemoteSourceStub = SourceRemoteSourceMock();
  });

  test("Check if data recieved from client Sources", () async {
    final response = await apiClient.get(ApiUtils.sourcesEndpoint,
        queryParameters: {ApiUtils.apiKeyParameterKey: ApiKey.apiKey});
    expect(response.statusCode, 200);
  });

  test("Check data in the Json", () async {
    final response = await apiClient.get(ApiUtils.sourcesEndpoint,
        queryParameters: {ApiUtils.apiKeyParameterKey: ApiKey.apiKey});
    if (response.statusCode == 200) {
      final sourceListResponse = SourcesResponse.fromJson(response.data);
      expect(sourceListResponse.status, "ok");
      expect(response.headers.value("content-type"),
          "application/json; charset=utf-8");
    } else {
      printOnFailure("Data in JSon not as expected");
    }
  });

  /// Mocking the data source to check for correct responses i.e Success and failiure
  test("Mocking success behaviour", () async {
    final ResponseWrapper response = Success(data: []);
    when(() => sourcesListRemoteSourceStub.getSourcesList())
        .thenAnswer((_) async => Future(() => response));
    final responseValue = await sourcesListRemoteSourceStub.getSourcesList();
    final isInstanceOf = responseValue is Success;
    expect(isInstanceOf, true);
  });

  test("Mocking failiure behaviour", () async {
    final ResponseWrapper response =
        Failure(error: Exception("Random APi error"));
    when(() => sourcesListRemoteSourceStub.getSourcesList())
        .thenAnswer((_) async => Future(() => response));
    final responseValue = await sourcesListRemoteSourceStub.getSourcesList();
    final isInstanceOf = responseValue is Failure;
    expect(isInstanceOf, true);
  });
}
