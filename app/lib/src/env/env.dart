import 'dart:developer' as developer;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  final String baseUrl;
  final String apiKey;

  static Environment? _instance;

  Environment._()
      : baseUrl =
            dotenv.env['BASE_URL'] ?? const String.fromEnvironment("BASE_URL"),
        apiKey =
            dotenv.env['API_KEY'] ?? const String.fromEnvironment("API_KEY") {
    _instance = this;

    developer.log('Base url: $baseUrl\nAPI Key: $apiKey');
  }

  factory Environment() {
    return _instance ?? (_instance = Environment._());
  }
}
