import 'package:flutter/material.dart';
import 'package:food_blueprint/src/theme/theme.dart';
import 'package:food_blueprint/src/pages/order_show/order_show_controller.dart';

class BorderedTextFormField extends StatelessWidget {
  final Widget child;

  const BorderedTextFormField({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black, // Set the border color
          width: 1.0, // Set the border width
        ),
        borderRadius:
            BorderRadius.all(Radius.circular(8.0)), // Set the border radius
      ),
      child: child,
    );
  }
}

class OrderConfirmPage extends StatelessWidget {
  final OrderShowController controller;

  const OrderConfirmPage({required this.controller, super.key});

  static const routeName = '/order_show';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home'), backgroundColor: COLOR_PRIMARY),
      body: Container(
        color: COLOR_SECONDARY,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Ďakujeme",
                style: TextStyle(
                    color: COLOR_TEXT,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              Text(
                "Vaša objednávka je na ceste!",
                style: TextStyle(
                    color: COLOR_TEXT,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
