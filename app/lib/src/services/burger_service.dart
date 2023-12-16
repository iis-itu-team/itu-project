import 'dart:convert';
import 'dart:developer' as developer;

import 'package:food_blueprint/src/http/client.dart';
import 'package:food_blueprint/src/http/result.dart';
import 'package:food_blueprint/src/models/burger.dart';

class GetBurgersInput {
  String? keeperId;
  bool? published;

  GetBurgersInput();

  GetBurgersInput.from(this.keeperId, this.published);

  @override
  String toString() =>
      'GetBurgersInput keeperId=$keeperId,published=$published';
}

class BurgerService {
  Future<HttpResult<List<Burger>>> listBurgers(GetBurgersInput? input) async {
    final HttpClient client = HttpClient.fromEnv();

    developer.log("bef: ${input.toString()}");
    GetBurgersInput realInput = input ?? GetBurgersInput();
    developer.log(realInput.toString());

    Map<String, String> queryParams = {};

    if (realInput.keeperId != null) {
      queryParams["keeperId"] = realInput.keeperId!;
    }

    if (realInput.published != null) {
      queryParams["published"] = realInput.published.toString();
    }

    final response =
        await client.get(client.route("/burgers", query: queryParams));

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

  Future<HttpResult<List<Burger>>> listCommunityBurgers(
      {String searchQuery = ''}) async {
    final HttpClient client = HttpClient.fromEnv();

    final response = await client
        .get(client.route("/burgers"), headers: {'published': 'true'});

    final json = jsonDecode(response.body) as Map<String, dynamic>;

    List<Burger> burgers = [];

    if (json["status"] == "success") {
      // deserialize
      for (final Map<String, dynamic> burgerJson in json["data"]) {
        burgers.add(Burger.fromJson(burgerJson));
      }
    }

    // filter out burgers based on searchQuery
    burgers.retainWhere((Burger burger) {
      if (searchQuery == '') {
        return true;
      } else {
        return (burger.name ?? '').contains(searchQuery);
      }
    });

    developer.log("Fetched ${burgers.length} burger(s)...");

    return HttpResult(response.statusCode, json["status"], burgers);
  }

  Future<HttpResult<List<Burger>>> listBestCommunityBurgers(
      {int topBurgersCount = 10}) async {
    final HttpClient client = HttpClient.fromEnv();

    final response = await client
        .get(client.route("/burgers"), headers: {'published': 'true'});

    final json = jsonDecode(response.body) as Map<String, dynamic>;

    List<Burger> burgers = [];

    if (json["status"] == "success") {
      // deserialize
      for (final Map<String, dynamic> burgerJson in json["data"]) {
        burgers.add(Burger.fromJson(burgerJson));
      }
    }

    // sort burgers based on rating and keep on top N burgers
    burgers.sort((Burger burger1, Burger burger2) {
      int rating1 = burger1.rating ?? 0;
      int rating2 = burger2.rating ?? 0;
      if (rating1 == rating2) {
        return 0;
      } else if (rating1 < rating2) {
        return 1;
      } else {
        return -1;
      }
    });
    if (topBurgersCount > burgers.length) {
      burgers.removeRange(topBurgersCount, burgers.length);
    }

    developer.log("Fetched ${burgers.length} burger(s)...");

    return HttpResult(response.statusCode, json["status"], burgers);
  }

  Future<HttpResult<Burger>> updateBurger(String id, Burger burger) async {
    final HttpClient client = HttpClient.fromEnv();

    final response = await client.put(client.route('/burgers/${burger.id}'),
        body: jsonEncode(burger.toUpdateInputJson()));

    final json = jsonDecode(response.body) as Map<String, dynamic>;

    if (!json.keys.contains("status")) {
      return HttpResult(response.statusCode, "validation_error", null);
    }

    Burger updatedBurger = Burger.fromJson(json["data"]);

    return HttpResult(response.statusCode, json["status"], updatedBurger);
  }

  Future<HttpResult<Burger>> createBurger(Burger burger) async {
    final HttpClient client = HttpClient.fromEnv();

    final response = await client.post(client.route('/burgers'),
        body: jsonEncode(burger.toUpdateInputJson()));

    final json = jsonDecode(response.body) as Map<String, dynamic>;

    if (!json.keys.contains("status")) {
      return HttpResult(response.statusCode, "validation_error", null);
    }

    Burger createdBurger = Burger.fromJson(json["data"]);

    return HttpResult(response.statusCode, json["status"], createdBurger);
  }

  Future<HttpResult<void>> deleteBurger(String id) async {
    final HttpClient client = HttpClient.fromEnv();

    final response = await client.delete(client.route('/burgers/$id'));

    final json = jsonDecode(response.body) as Map<String, dynamic>;

    return HttpResult(response.statusCode, json["status"], null);
  }
}
