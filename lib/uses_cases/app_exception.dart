class AppExceptions implements Exception {
  // ignore: prefer_typing_uninitialized_variables
  final _message;
  // ignore: prefer_typing_uninitialized_variables
  final _prefix;

  AppExceptions([this._message, this._prefix]);

  @override
  String toString() {
    return " $_prefix $_message";
  }
}

class InternetException extends AppExceptions {
  InternetException([String? message]) : super(message, ' no internet : ');
}

class RequestTimeOut extends AppExceptions {
  RequestTimeOut([String? message]) : super(message, ' Request time out : ');
}

class ServerException extends AppExceptions {
  ServerException([String? message])
      : super(message, 'Internet Server Error :-');
}

class InvalidUrlException extends AppExceptions {
  InvalidUrlException([String? message]) : super(message, ' Invalid Url : ');
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message])
      : super(message, ' error in connection  : ');
}