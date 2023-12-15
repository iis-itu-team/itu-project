import 'package:food_blueprint/src/env/env.dart';

class ImageUrlLoader {
  static final String baseUrl = Environment().baseUrl;

  static String getServedImageUrl(String? icon, String defaultIcon) {
    return icon != null ? '$baseUrl/$icon' : defaultIcon;
  }
}
