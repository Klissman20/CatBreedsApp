import 'package:cat_breeds_app/infrastructure/shared/exception/technical_exception.dart';
import 'package:cat_breeds_app/infrastructure/shared/http_client/exceptions/http_client_exception.dart';
import 'package:http/http.dart';

class HttpClient {
  HttpClient() {
    _client = Client();
    _timeOut = const Duration(seconds: _maxSecondsToWaitResponse);
  }

  late final Client _client;
  late final Duration _timeOut;

  static const _maxSecondsToWaitResponse = 10;
  static const _httpStatusCodeOk = 200;

  Future<String> getRequest(Uri url) async {
    Response response;
    try {
      response = await _client.get(url).timeout(_timeOut);
    } catch (e) {
      throw TechnicalException(e.toString());
    }
    return response.statusCode == _httpStatusCodeOk
        ? response.body
        : throw HttpClientException();
  }
}
