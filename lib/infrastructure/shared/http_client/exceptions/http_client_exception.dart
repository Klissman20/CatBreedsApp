import 'package:cat_breeds_app/infrastructure/shared/exception/technical_exception.dart';

class HttpClientException extends TechnicalException {
  HttpClientException() : super(_httpclientExceptionMessage);

  static const _httpclientExceptionMessage =
      'There was an error when trying to connect to cat breeds service, please try again later.';
}
