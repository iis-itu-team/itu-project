/// Copyright (C) -> see copyright_notice.txt in root dir
///
///  Author: Martin Otradovec
///  Author e-mail: xotrad00@fit.vutbr.cz
///  Date: 15. 12. 2023
///
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
