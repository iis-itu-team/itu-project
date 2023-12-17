/// Copyright (C) -> see copyright_notice.txt in root dir
///
///  Author: Martin Otradovec
///  Author e-mail: xotrad00@fit.vutbr.cz
///  Date: 05. 11. 2023
///
import 'dart:developer' as developer;

import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  final String apiUrl;
  final String baseUrl;
  final String apiKey;

  static Environment? _instance;

  Environment._()
      : baseUrl =
            dotenv.env['BASE_URL'] ?? const String.fromEnvironment("BASE_URL"),
        apiUrl =
            '${dotenv.env['BASE_URL'] ?? const String.fromEnvironment("BASE_URL")}/api',
        apiKey =
            dotenv.env['API_KEY'] ?? const String.fromEnvironment("API_KEY") {
    _instance = this;

    developer.log('Base url: $baseUrl\nAPI url: $apiUrl\nAPI Key: $apiKey');
  }

  factory Environment() {
    return _instance ?? (_instance = Environment._());
  }
}
