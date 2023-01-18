
class AppException implements Exception {
  String? message;
  String? prefix;
  String? url;
  AppException([this.message,this.prefix,this.url]);
}

class BadRequestException extends AppException {
  BadRequestException(String message,String url) : super(message,'Bad Request',url);
}

class FetchDataException extends AppException {
  FetchDataException(String message,String url) : super(message,'Unable to process',url);
}

class ApiNotRespondingException extends AppException {
  ApiNotRespondingException(String message,String url) : super(message,'Api not responded in time',url);
}

class UnAuthorizedException extends AppException {
  UnAuthorizedException(String message,String url) : super(message,'UnAuthrized request',url);
}