class RestApiException implements Exception {
  final String? message;

  const RestApiException(this.message) : super();
}