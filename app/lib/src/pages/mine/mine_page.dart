import 'package:flutter/material.dart';
import 'package:food_blueprint/src/pages/home/home_controller.dart';
import 'package:food_blueprint/src/pages/order_new/order_new_page.dart';
import 'package:food_blueprint/src/theme/theme.dart';

import 'package:food_blueprint/src/widgets/custom_app_bar.dart';
import 'package:food_blueprint/src/widgets/custom_row_menu.dart';

class MinePage extends StatelessWidget {
  static const routeName = '/mine';

  TextStyle linkStyle = const TextStyle(color: Colors.blue);

  final HomeController controller;

  MinePage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(text: 'Moje'),
      body: const CustomRowMenu(),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(10),
        height: 100,
        color: COLOR_PRIMARY,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton.large(
              onPressed: () {
                Navigator.pushNamed(context, OrderNewPage.routeName);
              },
              backgroundColor: COLOR_SECONDARY,
              child:
                  const Text('Objednať!', style: TextStyle(color: COLOR_TEXT)),
            ),
          ],
        ),
      ),
    );
  }
}
