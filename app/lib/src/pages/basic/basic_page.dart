import 'package:flutter/material.dart';
import 'package:food_blueprint/src/pages/home/home_controller.dart';
import 'package:food_blueprint/src/types/cart.dart';
import 'package:food_blueprint/src/widgets/bottom_navigation_widget.dart';
import 'package:food_blueprint/src/widgets/custom_app_bar.dart';
import 'package:food_blueprint/src/widgets/custom_row_menu.dart';

class BasicPage extends StatelessWidget {
  static const routeName = '/basic';

  final Cart cart;

  final TextStyle linkStyle = const TextStyle(color: Colors.blue);

  final HomeController controller;

  const BasicPage({super.key, required this.controller, required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(text: 'Základné'),
        body: const CustomRowMenu(),
        bottomNavigationBar: BottomNavigationWidget(cart: cart));
  }
}
