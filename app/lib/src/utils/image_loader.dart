import 'dart:developer' as developer;

import 'package:food_blueprint/src/env/env.dart';

class ImageUrlLoader {
  static final String baseUrl = Environment().baseUrl;

  static String getServedImageUrl(String? icon, String defaultIcon) {
    developer.log('$icon');
    return icon != null ? '$baseUrl$icon' : defaultIcon;
  }

  static String prefixUrl(String? url) {
    return '$baseUrl$url';
  }
}
