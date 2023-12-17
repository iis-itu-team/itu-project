///
///  Author: Martin Otradovec
///  Author e-mail: xotrad00@fit.vutbr.cz
///  Date: 13. 12. 2023
///
import 'dart:convert';

import 'dart:developer' as developer;

import 'package:food_blueprint/src/http/client.dart';
import 'package:food_blueprint/src/http/result.dart';
import 'package:food_blueprint/src/models/ingredient.dart';

class IngredientService {
  Future<HttpResult<List<Ingredient>>> listIngredients() async {
    final HttpClient client = HttpClient.fromEnv();

    final response = await client.get(client.route("/ingredients"));

    final json = jsonDecode(response.body) as Map<String, dynamic>;

    List<Ingredient> ingredients = [];

    if (json["status"] == "success") {
      // deserialize
      for (final Map<String, dynamic> ingredientJson in json["data"]) {
        ingredients.add(Ingredient.fromJson(ingredientJson));
      }
    }

    return HttpResult(response.statusCode, json["status"], ingredients);
  }

  Future<HttpResult<List<String>>> listCategories() async {
    developer.log('fetching categories');
    final HttpClient client = HttpClient.fromEnv();

    final response = await client.get(client.route("/ingredients/categories"));

    final json = jsonDecode(response.body) as Map<String, dynamic>;

    developer.log(json.toString());
    developer.log(json.runtimeType.toString());
    developer.log(json["data"].toString());

    List<String> categories = [];

    if (json["status"] == "success") {
      List<dynamic> ls = json["data"];
      categories.addAll(ls.map((i) => i as String).toList());
    }

    developer.log(categories.toString());

    return HttpResult(response.statusCode, json["status"], categories);
  }
}
