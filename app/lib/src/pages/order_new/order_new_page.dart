import 'package:flutter/material.dart';
import 'package:food_blueprint/src/pages/settings/settings_page.dart';
import 'package:food_blueprint/src/theme/theme.dart';
import 'package:food_blueprint/src/pages/order_new/order_new_controller.dart';
import 'package:food_blueprint/src/pages/order_new/order_confirm_page.dart';

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
        borderRadius: const BorderRadius.all(
            Radius.circular(8.0)), // Set the border radius
      ),
      child: child,
    );
  }
}

class OrderNewPage extends StatelessWidget {
  final OrderNewController controller;

  const OrderNewPage({required this.controller, super.key});

  static const routeName = '/order_new';

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
              Navigator.pushNamed(context, SettingsPage.routeName);
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
                padding: const EdgeInsets.all(10),
                child: const Text("Shrnutí",
                    style: TextStyle(
                        color: COLOR_TEXT,
                        fontSize: 25,
                        fontWeight: FontWeight.bold)),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: const Text("Doručení",
                          style: TextStyle(
                              color: COLOR_TEXT,
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // Adjust this based on your layout requirements
                        children: [
                          const Text(
                            "Mesto",
                            style: TextStyle(color: COLOR_TEXT, fontSize: 18),
                          ),
                          const SizedBox(height: 10),
                          BorderedTextFormField(
                            child: TextFormField(),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // Adjust this based on your layout requirements
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    const Text(
                                      "Ulica",
                                      style: TextStyle(
                                          color: COLOR_TEXT, fontSize: 18),
                                    ),
                                    const SizedBox(height: 10),
                                    BorderedTextFormField(
                                      child: TextFormField(),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  children: [
                                    const Text(
                                      "č. p.",
                                      style: TextStyle(
                                          color: COLOR_TEXT, fontSize: 18),
                                    ),
                                    const SizedBox(height: 10),
                                    BorderedTextFormField(
                                      child: TextFormField(),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // Adjust this based on your layout requirements
                        children: [
                          const Text(
                            "poznámka pro řidiče",
                            style: TextStyle(color: COLOR_TEXT, fontSize: 18),
                          ),
                          const SizedBox(height: 10),
                          BorderedTextFormField(
                            child: TextFormField(),
                          ),
                        ],
                      ),
                    ),
                    CheckboxListTile(
                      value: false,
                      onChanged: (val) {},
                      activeColor: COLOR_SECONDARY,
                      title: const Text(
                        "pred dom",
                        style: TextStyle(color: COLOR_TEXT, fontSize: 18),
                      ),
                    ),
                    CheckboxListTile(
                      value: false,
                      onChanged: (val) {},
                      activeColor: COLOR_SECONDARY,
                      title: const Text(
                        "ku dverám",
                        style: TextStyle(color: COLOR_TEXT, fontSize: 18),
                      ),
                    ),
                    CheckboxListTile(
                      value: false,
                      onChanged: (val) {},
                      activeColor: COLOR_SECONDARY,
                      title: const Text(
                        "ku dverám bytu",
                        style: TextStyle(color: COLOR_TEXT, fontSize: 18),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // Adjust this based on your layout requirements
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    const Text(
                                      "poschodie",
                                      style: TextStyle(
                                          color: COLOR_TEXT, fontSize: 18),
                                    ),
                                    const SizedBox(height: 10),
                                    BorderedTextFormField(
                                      child: TextFormField(),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  children: [
                                    const Text(
                                      "číslo bytu",
                                      style: TextStyle(
                                          color: COLOR_TEXT, fontSize: 18),
                                    ),
                                    const SizedBox(height: 10),
                                    BorderedTextFormField(
                                      child: TextFormField(),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: const Text("Platba",
                          style: TextStyle(
                              color: COLOR_TEXT,
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(children: [
                        CheckboxListTile(
                          value: false,
                          onChanged: (val) {},
                          activeColor: COLOR_SECONDARY,
                          title: const Text(
                            "pri doručení (karta/hotovosť)",
                            style: TextStyle(color: COLOR_TEXT, fontSize: 18),
                          ),
                        ),
                        CheckboxListTile(
                          value: false,
                          onChanged: (val) {},
                          activeColor: COLOR_SECONDARY,
                          title: const Text(
                            "online kartou",
                            style: TextStyle(color: COLOR_TEXT, fontSize: 18),
                          ),
                        ),
                        CheckboxListTile(
                          value: false,
                          onChanged: (val) {},
                          activeColor: COLOR_SECONDARY,
                          title: const Text(
                            "paypal / google pay / apple pay",
                            style: TextStyle(color: COLOR_TEXT, fontSize: 18),
                          ),
                        ),
                      ]),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(10),
        height: 100,
        color: COLOR_PRIMARY,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton.large(
              onPressed: () {
                Navigator.pushNamed(context, OrderConfirmPage.routeName);
              },
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
