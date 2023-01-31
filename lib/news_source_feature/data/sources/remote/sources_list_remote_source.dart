import 'package:news_app/common/api/api_client.dart';
import 'package:news_app/common/api/response_wrapper.dart';
import 'package:news_app/news_source_feature/data/sources/remote/response/sources_response_entity.dart';
import 'package:news_app/news_source_feature/domain/model/news_source_entity.dart';
import 'package:news_app/utils/api_utils.dart';

import '../../../../api_key.dart';
import '../../../../common/api/api_exception_wrapper.dart';
import '../../../../utils/number_utils.dart';

class SourcesListRemoteSource {
  late final ApiClient apiClient;

  SourcesListRemoteSource({required this.apiClient});

  Future<ResponseWrapper> getSourcesList() async {
    try {
      final response = await apiClient.get(ApiUtils.sourcesEndpoint,
          queryParameters: {ApiUtils.apiKeyParameterKey: ApiKey.apiKey});
      final sourcesList = SourcesResponse.fromJson(response.data);
      if (response.statusCode == 200) {
        final list = sourcesList.sources
            ?.map((source) => source.getNewsSourceEntity)
            .toList();
        return Success(data: list);
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
