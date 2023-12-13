import 'dart:convert';

import 'package:food_blueprint/src/http/client.dart';
import 'package:food_blueprint/src/http/result.dart';
import 'package:food_blueprint/src/models/ingredient.dart';

class IngredientService {
  Future<HttpResult<List<Ingredient>>> listIngredients() async {
    final HttpClient client = HttpClient.fromEnv();

    final response = await client.get(client.route("/ingredients"));

    final json = jsonDecode(response.body) as Map<String, dynamic>;

    List<Ingredient> ingredient = [];

    if (json["status"] == "success") {
      // deserialize
      for (final Map<String, dynamic> ingredientJson in json["data"]) {
        ingredient.add(Ingredient.fromJson(ingredientJson));
      }
    }

    return HttpResult(response.statusCode, json["status"], ingredient);
  }
}