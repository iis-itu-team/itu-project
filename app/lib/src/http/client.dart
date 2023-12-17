/// Copyright (C) -> see copyright_notice.txt in root dir
///
///  Author: Martin Otradovec
///  Author e-mail: xotrad00@fit.vutbr.cz
///  Date: 05. 11. 2023
///
import 'dart:developer' as developer;

import 'package:food_blueprint/src/env/env.dart';
import 'package:food_blueprint/src/utils/keeper_store.dart';
import 'package:http/http.dart';

class HttpClient extends BaseClient {
  final Client _inner;
  final String _baseUrl;
  final String _apiKey;

  HttpClient(this._baseUrl, this._apiKey, this._inner);

  HttpClient.withDefaultClient(this._baseUrl, this._apiKey) : _inner = Client();

  HttpClient.fromEnv()
      : this.withDefaultClient(Environment().apiUrl, Environment().apiKey);

  Uri route(String path, {Map<String, String?>? query}) {
    Uri route = Uri.parse('$_baseUrl$path').replace(queryParameters: query);
    developer.log('Route: ${route.toString()}');
    return route;
  }

  @override
  Future<StreamedResponse> send(BaseRequest request) async {
    request.headers["API-Key"] = _apiKey;

    // append keeper id header
    String? keeperId = await KeeperStore.getKeeperId();
    if (keeperId != null) {
      // should be null only when requesting a new keeper id
      request.headers['Keeper-ID'] = keeperId;
    }

    // assume everything we're sending is json
    request.headers['Content-Type'] = 'application/json';

    return _inner.send(request);
  }
}
