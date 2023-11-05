import 'dart:convert';

import 'dart:developer' as developer;

import 'package:food_blueprint/src/http/client.dart';
import 'package:food_blueprint/src/http/result.dart';
import 'package:food_blueprint/src/models/food.dart';
import 'package:food_blueprint/src/models/ingredient.dart';

class FoodService {
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

  Future<HttpResult<List<Food>>> listFoods() async {
    final HttpClient client = HttpClient.fromEnv();

    final response = await client.get(client.route("/foods"));

    final json = jsonDecode(response.body) as Map<String, dynamic>;

    List<Food> foods = [];

    if (json["status"] == "success") {
      // deserialize
      for (final Map<String, dynamic> foodJson in json["data"]) {
        foods.add(Food.fromJson(foodJson));
      }
    }

    return HttpResult(response.statusCode, json["status"], foods);
  }

  Future<HttpResult<void>> updateFood(String id, EditedFood food) async {
    final HttpClient client = HttpClient.fromEnv();

    final response = await client.put(client.route('/foods/${food.id}'), body: food.toJson());

    final json = jsonDecode(response.body) as Map<String, dynamic>;

    return HttpResult(response.statusCode, json["status"], null);
  }

  Future<HttpResult<void>> createFood(EditedFood food) async {
    final HttpClient client = HttpClient.fromEnv();

    developer.log(jsonEncode(food.toJson()));

    final response = await client.post(client.route('/foods'), headers: { 'Content-Type': "application/json" }, body: jsonEncode(food.toJson()).toString());

    final json = jsonDecode(response.body) as Map<String, dynamic>;

    if (!json.keys.contains("status")) {
      developer.log(json.toString());
      return HttpResult(response.statusCode, "validation_error", null);
    }

    return HttpResult(response.statusCode, json["status"], null);
  }
}
