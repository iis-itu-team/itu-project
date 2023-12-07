import 'package:flutter/material.dart';
import 'package:food_blueprint/src/pages/order/order_controller.dart';

class OrderPage extends StatelessWidget {
  final OrderController controller;

  const OrderPage({required this.controller, super.key});

  static const routeName = '/order';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          children: [
            const Text("Burgers:"),
            const Text("Fill the shipping:"),
          ],
        ),
      ),
    );
  }
}
