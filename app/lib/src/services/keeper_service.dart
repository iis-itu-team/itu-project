import 'dart:convert';
import 'dart:developer' as developer;

import 'package:food_blueprint/src/http/client.dart';
import 'package:food_blueprint/src/http/result.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KeeperService {

  Future<String> getKeeperId() async {
    // fetch keeper id from shared preferences or create a new one through the API

    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? id = prefs.getString("keeper_id");

    id ??= (await createKeeper()).data;

    if (id == null) {
      // todo: handle differently?
      developer.log("Couldn't create Keeper identification.", level: 5);
      throw Exception("Couldn't create Keeper identification.");
    }

    return id;
  }

  Future<HttpResult<String>> createKeeper() async {
    final HttpClient client = HttpClient.fromEnv();

    final response = await client.post(client.route('/keepers'),
        headers: {'Content-Type': "application/json"});

    final json = jsonDecode(response.body) as Map<String, dynamic>;

    developer.log(json.toString());

    if (!json.keys.contains("status")) {
      return HttpResult(response.statusCode, "validation_error", null);
    }

    return HttpResult(response.statusCode, json["status"], json["data"]);
  }
}
