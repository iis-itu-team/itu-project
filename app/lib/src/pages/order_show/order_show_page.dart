import 'package:flutter/material.dart';
import 'package:food_blueprint/src/theme/theme.dart';
import 'package:food_blueprint/src/pages/order_show/order_show_controller.dart';
import 'package:food_blueprint/src/widgets/custom_app_bar.dart';

class OrderShowPage extends StatelessWidget {
  final OrderShowController controller;

  const OrderShowPage({required this.controller, super.key});

  static const routeName = '/order_show';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(text: 'Moje objednávky'),
      body: Container(
        color: COLOR_SECONDARY,
        padding: const EdgeInsets.only(left: 10),
        child: const SingleChildScrollView(),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(10),
        height: 100,
        color: COLOR_PRIMARY,
      ),
    );
  }
}
