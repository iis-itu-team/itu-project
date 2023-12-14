import 'dart:convert';

import 'dart:developer' as developer;

import 'package:food_blueprint/src/http/client.dart';
import 'package:food_blueprint/src/http/result.dart';
import 'package:food_blueprint/src/models/order.dart';

class OrderService {
  Future<HttpResult<void>> createOrder(Order order) async {
    final HttpClient client = HttpClient.fromEnv();

    developer.log(jsonEncode(order.toJson()));

    final response = await client.post(client.route('/orders'),
        headers: {'Content-Type': "application/json"},
        body: jsonEncode(order.toJson()).toString());

    final json = jsonDecode(response.body) as Map<String, dynamic>;

    if (!json.keys.contains("status")) {
      developer.log(json.toString());
      return HttpResult(response.statusCode, "validation_error", null);
    }

    return HttpResult(response.statusCode, json["status"], null);
  }

  Future<HttpResult<List<Order>>> getOrders() async {
    final HttpClient client = HttpClient.fromEnv();

    final response = await client.get(client.route("/orders"));

    final json = jsonDecode(response.body) as Map<String, dynamic>;

    List<Order> orders = [];

    if (json["status"] == "success") {
      // deserialize
      for (final Map<String, dynamic> burgerJson in json["data"]) {
        orders.add(Order.fromJson(burgerJson));
      }
    }

    developer.log("Fetched ${orders.length} burger(s)...");

    return HttpResult(response.statusCode, json["status"], orders);
  }
}
