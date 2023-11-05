import 'dart:convert';

import 'package:food_blueprint/src/http/client.dart';
import 'package:food_blueprint/src/http/result.dart';
import 'package:food_blueprint/src/models/food.dart';

class FoodService {
  Future<HttpResult<List<Food>>> listFoods() async {
    final HttpClient client = HttpClient.fromEnv();

    final response = await client.get(
        client.route("/foods")
    );

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
}
