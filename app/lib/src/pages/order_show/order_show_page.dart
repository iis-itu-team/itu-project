import 'package:flutter/material.dart';
import 'package:food_blueprint/src/theme/theme.dart';
import 'package:food_blueprint/src/pages/order_show/order_show_controller.dart';

class OrderShowPage extends StatelessWidget {
  final OrderShowController controller;

  const OrderShowPage({required this.controller, super.key});

  static const routeName = '/order_show';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: COLOR_PRIMARY,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          ),
        ],
      ),
      body: Container(
        color: COLOR_SECONDARY,
        padding: const EdgeInsets.only(left: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Shrnutí",
                  style: TextStyle(
                      color: COLOR_TEXT,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10),
        height: 100,
        color: COLOR_PRIMARY,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton.large(
              onPressed: () {},
              backgroundColor: COLOR_SECONDARY,
              child:
                  const Text('Objednat!', style: TextStyle(color: COLOR_TEXT)),
            ),
          ],
        ),
      ),
    );
  }
}
