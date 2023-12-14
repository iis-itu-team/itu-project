import 'package:shared_preferences/shared_preferences.dart';

class KeeperStore {
  static Future<String?> getKeeperId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("keeper_id");
  }
}
