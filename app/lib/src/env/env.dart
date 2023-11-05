import 'dart:developer' as developer;

class Environment {
  final String baseUrl;
  final String apiKey;

  static Environment? _instance;

  Environment._()
      : baseUrl = const String.fromEnvironment("BASE_URL"),
        apiKey = const String.fromEnvironment("API_KEY") {
    _instance = this;

    developer.log('Base url: $baseUrl\nAPI Key: $apiKey');
  }

  factory Environment() {
    return _instance ?? (_instance = Environment._());
  }
}
