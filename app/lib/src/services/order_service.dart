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

  Future<HttpResult<List<Order>>> listOrders() async {
    final HttpClient client = HttpClient.fromEnv();

    final response = await client.get(client.route("/orders"));

    final json = jsonDecode(response.body) as Map<String, dynamic>;

    List<Order> orders = [];

    if (json["status"] == "success") {
      for (final Map<String, dynamic> orderJson in json["data"]) {
        orders.add(Order.fromJson(orderJson));
      }
    }

    developer.log("Fetched ${orders.length} orders(s)...");

    return HttpResult(response.statusCode, json["status"], orders);
  }
}
