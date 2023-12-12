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
      appBar: AppBar(title: const Text('Home'), backgroundColor: COLOR_PRIMARY),
      body: Container(
        color: COLOR_SECONDARY,
        padding: const EdgeInsets.only(left: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16.0),
                child: Text("Shrnutí",
                    style: TextStyle(
                        color: COLOR_TEXT,
                        fontSize: 25,
                        fontWeight: FontWeight.bold)),
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(16.0),
                      child: Text("Doručení",
                          style: TextStyle(
                              color: COLOR_TEXT,
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
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
                    CheckboxListTile(
                        value: false,
                        onChanged: (val) {},
                        activeColor: COLOR_SECONDARY,
                        title: Text("pred dom")),
                    CheckboxListTile(
                        value: false,
                        onChanged: (val) {},
                        activeColor: COLOR_SECONDARY,
                        title: Text("ku dverám")),
                    CheckboxListTile(
                        value: false,
                        onChanged: (val) {},
                        activeColor: COLOR_SECONDARY,
                        title: Text("ku dverám bytu")),
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
                    const Text("platba",
                        style: TextStyle(
                            color: COLOR_TEXT,
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                    CheckboxListTile(
                        value: false,
                        onChanged: (val) {},
                        activeColor: COLOR_SECONDARY,
                        title: Text("pri doručení (karta/hotovosť)")),
                    CheckboxListTile(
                        value: false,
                        onChanged: (val) {},
                        activeColor: COLOR_SECONDARY,
                        title: Text("online kartou")),
                    CheckboxListTile(
                        value: false,
                        onChanged: (val) {},
                        activeColor: COLOR_SECONDARY,
                        title: Text("paypal / google pay / apple pay"))
                  ],
                ),
              ),
            ],
            // Divider(color: Colors.black)),
          ),
        ),
      ),
      bottomNavigationBar: Container(
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
