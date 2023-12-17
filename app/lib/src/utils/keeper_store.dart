/// Copyright (C) -> see copyright_notice.txt in root dir
///
///  Author: Martin Otradovec
///  Author e-mail: xotrad00@fit.vutbr.cz
///  Date: 15. 12. 2023
///
import 'package:shared_preferences/shared_preferences.dart';

class KeeperStore {
  static Future<String?> getKeeperId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("keeper_id");
  }
}
