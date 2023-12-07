import 'package:flutter/material.dart';
import 'package:food_blueprint/src/pages/order/order_controller.dart';

class OrderPage extends StatelessWidget {
  final OrderController controller;

  const OrderPage({required this.controller, super.key});

  static const routeName = '/order-edit';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Order')),
      // body:
    );
  }
}
