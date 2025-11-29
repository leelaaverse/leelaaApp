class ApiException implements Exception {
  final String message;

  ApiException(this.message);

  @override
  String toString() => message;
}

class NetworkException extends ApiException {
  NetworkException() : super("No Internet Connection");
}

class ServerException extends ApiException {
  ServerException([String? message]) : super(message ?? "Server Error");
}

class BadRequestException extends ApiException {
  BadRequestException() : super("Invalid Request");
}

class UnauthorizedException extends ApiException {
  UnauthorizedException() : super("Unauthorized Access");
}

class NotFoundException extends ApiException {
  NotFoundException() : super("Resource Not Found");
}

class TimeoutException extends ApiException {
  TimeoutException() : super("Request Timed Out");
}
