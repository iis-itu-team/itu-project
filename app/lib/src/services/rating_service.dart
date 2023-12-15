import 'dart:convert';

import 'dart:developer' as developer;

import 'package:food_blueprint/src/http/client.dart';
import 'package:food_blueprint/src/http/result.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:food_blueprint/src/models/burger.dart';

class RatingService {
  static Future<HttpResult<Burger>> rateBurger(
      String? burgerId, BurgerRating rating) async {
    final HttpClient client = HttpClient.fromEnv();

    int ratingNumber;
    switch (rating) {
      case BurgerRating.up:
        ratingNumber = 1;
        break;
      case BurgerRating.down:
        ratingNumber = -1;
        break;
      default:
        ratingNumber = 0;
        break;
    }

    final response =
        await client.post(client.route('/burgers/${burgerId ?? ""}/ratings'),
            body: jsonEncode({
              'keeperId': (await SharedPreferences.getInstance())
                      .getString('keeper_id') ??
                  '',
              'rating': ratingNumber.toString()
            }));

    developer.log('Status is ${response.statusCode}');

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    final burger = Burger.fromJson(json['data']);

    return HttpResult(response.statusCode, json['status'], burger);
  }
}
