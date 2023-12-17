///
///  Author: Marek Vandík
///  Author e-mail: xvandi01@fit.vutbr.cz
///  Date: 13. 12. 2023
///
import 'dart:convert';

import 'dart:developer' as developer;

import 'package:food_blueprint/src/interfaces/irating_changed.dart';
import 'package:food_blueprint/src/http/client.dart';
import 'package:food_blueprint/src/http/result.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:food_blueprint/src/models/burger.dart';

class RatingService {
  List<IRatingChanged> listeners = [];

  void registerListener(IRatingChanged listener) {
    if (!listeners.contains(listener)) {
      listeners.add(listener);
    }
  }

  void unregisterListener(IRatingChanged listener) {
    if (listeners.contains(listener)) {
      listeners.remove(listener);
    }
  }

  Future<void> notify(
      String burgerId, BurgerRating currentRating, int totalRating) async {
    for (IRatingChanged listener in listeners) {
      listener.onRatingChanged(burgerId, currentRating, totalRating);
    }
  }

  Future<HttpResult<Burger>> rateBurger(
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

    notify(burger.id ?? '', burger.currentRating ?? BurgerRating.none,
        burger.rating ?? 0);

    return HttpResult(response.statusCode, json['status'], burger);
  }
}
