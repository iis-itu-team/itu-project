import 'package:flutter/material.dart';
import 'package:food_blueprint/src/pages/home/home_controller.dart';

import 'package:food_blueprint/src/widgets/custom_app_bar.dart';
import 'package:food_blueprint/src/widgets/custom_row_menu.dart';
import 'package:food_blueprint/src/widgets/bottom_navigation_widget.dart';

class MinePage extends StatelessWidget {
  static const routeName = '/mine';

  TextStyle linkStyle = const TextStyle(color: Colors.blue);

  final HomeController controller;

  MinePage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: CustomAppBar(text: 'Moje'),
        body: CustomRowMenu(),
        bottomNavigationBar: BottomNavigationWidget());
  }
}
