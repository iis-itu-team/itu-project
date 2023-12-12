import 'package:flutter/material.dart';
import 'package:food_blueprint/src/theme/theme.dart';
import 'package:food_blueprint/src/pages/order_new/order_new_controller.dart';
import 'package:food_blueprint/src/pages/order_new/order_confirm_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                child: Text("Shrnutí",
                    style: TextStyle(
                        color: COLOR_TEXT,
                        fontSize: 25,
                        fontWeight: FontWeight.bold)),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text("Doručení",
                          style: TextStyle(
                              color: COLOR_TEXT,
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // Adjust this based on your layout requirements
                        children: [
                          Text(
                            "Mesto",
                            style: TextStyle(color: COLOR_TEXT, fontSize: 18),
                          ),
                          SizedBox(height: 10),
                          BorderedTextFormField(
                            child: TextFormField(),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // Adjust this based on your layout requirements
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      "Ulica",
                                      style: TextStyle(
                                          color: COLOR_TEXT, fontSize: 18),
                                    ),
                                    SizedBox(height: 10),
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
                                    Text(
                                      "č. p.",
                                      style: TextStyle(
                                          color: COLOR_TEXT, fontSize: 18),
                                    ),
                                    SizedBox(height: 10),
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
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // Adjust this based on your layout requirements
                        children: [
                          Text(
                            "poznámka pro řidiče",
                            style: TextStyle(color: COLOR_TEXT, fontSize: 18),
                          ),
                          SizedBox(height: 10),
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
                      title: Text(
                        "pred dom",
                        style: TextStyle(color: COLOR_TEXT, fontSize: 18),
                      ),
                    ),
                    CheckboxListTile(
                      value: false,
                      onChanged: (val) {},
                      activeColor: COLOR_SECONDARY,
                      title: Text(
                        "ku dverám",
                        style: TextStyle(color: COLOR_TEXT, fontSize: 18),
                      ),
                    ),
                    CheckboxListTile(
                      value: false,
                      onChanged: (val) {},
                      activeColor: COLOR_SECONDARY,
                      title: Text(
                        "ku dverám bytu",
                        style: TextStyle(color: COLOR_TEXT, fontSize: 18),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // Adjust this based on your layout requirements
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      "poschodie",
                                      style: TextStyle(
                                          color: COLOR_TEXT, fontSize: 18),
                                    ),
                                    SizedBox(height: 10),
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
                                    Text(
                                      "číslo bytu",
                                      style: TextStyle(
                                          color: COLOR_TEXT, fontSize: 18),
                                    ),
                                    SizedBox(height: 10),
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
                      padding: EdgeInsets.all(20),
                      child: Text("Platba",
                          style: TextStyle(
                              color: COLOR_TEXT,
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(children: [
                        CheckboxListTile(
                          value: false,
                          onChanged: (val) {},
                          activeColor: COLOR_SECONDARY,
                          title: Text(
                            "pri doručení (karta/hotovosť)",
                            style: TextStyle(color: COLOR_TEXT, fontSize: 18),
                          ),
                        ),
                        CheckboxListTile(
                          value: false,
                          onChanged: (val) {},
                          activeColor: COLOR_SECONDARY,
                          title: Text(
                            "online kartou",
                            style: TextStyle(color: COLOR_TEXT, fontSize: 18),
                          ),
                        ),
                        CheckboxListTile(
                          value: false,
                          onChanged: (val) {},
                          activeColor: COLOR_SECONDARY,
                          title: Text(
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
            // Divider(color: Colors.black)),
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
