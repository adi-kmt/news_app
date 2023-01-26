class ApiUtils {
  ApiUtils._();

  // Base URL
  static const String baseUrl = "https://newsapi.org/";

  // Endpoints
  static const String topHeadlinesEndpoint = "v2/top-headlines";
  static const String sourcesEndpoint = "v2/top-headlines/sources";

  static const String apiKeyParameterKey = 'apiKey';

  // Headline Endpoints parameter keys
  static const String topHeadlineRequiredCountryParameterKey = 'country';
  static const String pageSizeParameterKey = 'pageSize';

  // Headline Endpoints parameter values
  static const String topHeadlineRequiredCountryParameterValue = "us";
  static const int maxNoArticlesParameterValue = 80;

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 15000;

  static const String genericApiErrorMessage = "Unexpected API error";
}
