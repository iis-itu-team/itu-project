import 'dart:developer' as developer;

import 'package:food_blueprint/src/env/env.dart';
import 'package:http/http.dart';

class HttpClient extends BaseClient {
  final Client _inner;
  final String _baseUrl;
  final String _apiKey;

  HttpClient(this._baseUrl, this._apiKey, this._inner);

  HttpClient.withDefaultClient(this._baseUrl, this._apiKey) : _inner = Client();

  HttpClient.fromEnv()
      : this.withDefaultClient(Environment().baseUrl, Environment().apiKey);

  Uri route(String path, {Map<String, String?>? query}) {
    Uri route = Uri.parse('$_baseUrl$path').replace(queryParameters: query);
    developer.log('Route: ${route.toString()}');
    return route;
  }

  @override
  Future<StreamedResponse> send(BaseRequest request) {
    request.headers["API-Key"] = _apiKey;
    return _inner.send(request);
  }
}
