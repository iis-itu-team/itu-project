import 'package:flutter/material.dart';
import 'package:food_blueprint/src/pages/home/home_controller.dart';

import 'package:food_blueprint/src/widgets/custom_app_bar.dart';
import 'package:food_blueprint/src/widgets/custom_row_menu.dart';
import 'package:food_blueprint/src/widgets/bottom_navigation_widget.dart';

class BasicPage extends StatelessWidget {
  static const routeName = '/basic';

  TextStyle linkStyle = const TextStyle(color: Colors.blue);

  final HomeController controller;

  BasicPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: CustomAppBar(text: 'Základné'),
        body: CustomRowMenu(),
        bottomNavigationBar: BottomNavigationWidget());
  }
}
