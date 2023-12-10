import 'package:flutter/material.dart';
import 'package:food_blueprint/src/theme/theme.dart';
import 'package:food_blueprint/src/pages/order/order_controller.dart';

class OrderPage extends StatelessWidget {
  final OrderController controller;

  const OrderPage({required this.controller, super.key});

  static const routeName = '/order';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Container(
          color: COLOR_PRIMARY,
          padding: const EdgeInsets.only(left: 16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Text("Shrnutí", style: TextStyle(color: COLOR_TEXT)),
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(16.0),
                        child: Text("Doručení",
                            style: TextStyle(color: COLOR_TEXT)),
                      ),
                      Container(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // Adjust this based on your layout requirements
                          children: [
                            Text(
                              "Mesto",
                              style: TextStyle(color: COLOR_TEXT),
                            ),
                            TextFormField(),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // Adjust this based on your layout requirements
                          children: [
                            Text("Ulice"),
                            TextFormField(),
                            Text("č.p."),
                            TextFormField(),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // Adjust this based on your layout requirements
                          children: [
                            Text(
                              "poznámka pro řidiče",
                              style: TextStyle(color: COLOR_TEXT),
                            ),
                            TextFormField(),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // Adjust this based on your layout requirements
                          children: [
                            Text("patro"),
                            TextFormField(),
                            Text("číslo bytu"),
                            TextFormField(),
                          ],
                        ),
                      ),
                      const Text("platba"),
                    ],
                  ),
                ),
              ],
              // Divider(color: Colors.black)),
            ),
          )),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {},
        child: const Text('Objednat!'),
        backgroundColor: COLOR_SECONDARY,
      ),
    );
  }
}
