/// Copyright (C) -> see copyright_notice.txt in root dir
///
///  Author: Martin Otradovec
///  Author e-mail: xotrad00@fit.vutbr.cz
///  Collaborator: Marek Vandík
///  Collaborator e-mail: xvandi01@fit.vutbr.cz
///  Date: 12. 12. 2023
///
import 'dart:convert';
import 'dart:developer' as developer;

import 'package:food_blueprint/src/http/client.dart';
import 'package:food_blueprint/src/http/result.dart';
import 'package:food_blueprint/src/models/burger.dart';

///  Author: Martin Otradovec
///  Class to abstract GET /burgers query parameters.
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
  ///  Author: Martin Otradovec
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

  /// Author: Marek Vandík
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

  /// Author: Marek Vandík
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
    if (burgers.length > topBurgersCount) {
      burgers.removeRange(topBurgersCount, burgers.length);
    }

    developer.log("Fetched ${burgers.length} burger(s)...");

    return HttpResult(response.statusCode, json["status"], burgers);
  }

  ///  Author: Martin Otradovec
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

  /// Author: Marek Vandík
  Future<HttpResult<void>> publishBurgers(List<Burger> burgers) async {
    final HttpClient client = HttpClient.fromEnv();

    var response;
    var json;
    String? status; // acumulate all error messages
    int? statusCode;

    for (Burger burger in burgers) {
      burger.published = true;
      response = await client.put(client.route('/burgers/${burger.id}'),
          body: jsonEncode(burger.toUpdateInputJson()));
      json = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode != 200) {
        status ??= '';
        statusCode ??= response.statusCode;
        status += ' ${burger.name ?? "empty_name"}: ${json["status"]}';
      }
    }

    return HttpResult(
        statusCode ?? response.statusCode, status ?? json['status'], null);
  }

  ///  Author: Martin Otradovec
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

  ///  Author: Martin Otradovec
  Future<HttpResult<void>> deleteBurger(String id) async {
    final HttpClient client = HttpClient.fromEnv();

    final response = await client.delete(client.route('/burgers/$id'));

    final json = jsonDecode(response.body) as Map<String, dynamic>;

    return HttpResult(response.statusCode, json["status"], null);
  }
}
