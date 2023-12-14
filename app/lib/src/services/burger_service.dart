import 'dart:convert';
import 'dart:developer' as developer;

import 'package:food_blueprint/src/http/client.dart';
import 'package:food_blueprint/src/http/result.dart';
import 'package:food_blueprint/src/models/burger.dart';

class BurgerService {
  Future<HttpResult<List<Burger>>> listBurgers() async {
    final HttpClient client = HttpClient.fromEnv();

    final response = await client.get(client.route("/burgers"));

    final json = jsonDecode(response.body) as Map<String, dynamic>;

    List<Burger> burgers = [];

    if (json["status"] == "success") {
      // deserialize
      for (final Map<String, dynamic> burgerJson in json["data"]) {
        burgers.add(Burger.fromJson(burgerJson));
      }
    }

    developer.log("Fetched ${burgers.length} burger(s)...");

    return HttpResult(response.statusCode, json["status"], burgers);
  }

  Future<HttpResult<List<Burger>>> listCommunityBurgers() async {
    final allBurgers = await listBurgers();

    List<Burger> sortedBurgers = allBurgers.data ?? [];

    if (allBurgers.statusCode == 200) {
      sortedBurgers = sortedBurgers.where((Burger burger) {
        return burger.publish;
      }).toList();
    }

    HttpResult<List<Burger>> communityBurgers =
        HttpResult(allBurgers.statusCode, allBurgers.status, sortedBurgers);

    return communityBurgers;
  }

  Future<HttpResult<void>> updateBurger(String id, Burger burger) async {
    final HttpClient client = HttpClient.fromEnv();

    final response = await client.put(client.route('/burgers/${burger.id}'),
        body: burger.toJson());

    final json = jsonDecode(response.body) as Map<String, dynamic>;

    return HttpResult(response.statusCode, json["status"], null);
  }

  Future<HttpResult<void>> createBurger(Burger burger) async {
    final HttpClient client = HttpClient.fromEnv();

    final response = await client.post(client.route('/burgers'),
        headers: {'Content-Type': "application/json"},
        body: jsonEncode(burger.toJson()).toString());

    final json = jsonDecode(response.body) as Map<String, dynamic>;

    if (!json.keys.contains("status")) {
      return HttpResult(response.statusCode, "validation_error", null);
    }

    return HttpResult(response.statusCode, json["status"], null);
  }
}
