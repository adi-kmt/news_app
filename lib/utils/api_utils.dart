class ApiUtils {
  ApiUtils._();

  // Base URL
  static const String baseUrl = "https://newsapi.org/";

  // Endpoints
  static const String topHeadlinesEndpoint = "v2/top-headlines";
  static const String sourcesEndpoint = "v2/top-headlines/sources";

  // Headline Endpoints parameter
  static const String topHeadlineRequiredCountryParameter = "country=us";

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 15000;
}
