import 'package:flutter/material.dart';
import 'package:food_blueprint/src/http/result.dart';
import 'package:food_blueprint/src/models/order.dart';
import 'package:food_blueprint/src/services/order_service.dart';
import 'package:food_blueprint/src/theme/theme.dart';
import 'package:food_blueprint/src/pages/order_new/order_new_controller.dart';
import 'package:food_blueprint/src/pages/order_new/order_confirm_page.dart';
import 'package:food_blueprint/src/widgets/custom_app_bar.dart';
import 'package:food_blueprint/src/widgets/custom_checkbox.dart';

class BorderedTextFormField extends StatelessWidget {
  final Widget child;

  const BorderedTextFormField({super.key, required this.child});

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

String? street;
String? houseNumber;
String? zipCode;
String? city;
String? floor;
String? notes;
bool? toHouse = false;
bool? toDoors = false;
bool? toFlatDoors = false;

late final OrderService orderService;

class OrderNewPage extends StatelessWidget {
  final OrderNewController controller;

  OrderNewPage({required this.controller, super.key});

  static const routeName = '/order-new';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(text: 'Nová objednávka'),
      body: Container(
        color: COLOR_SECONDARY,
        padding: const EdgeInsets.only(left: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: const Text(
                  "Shrnutí",
                  style: TextStyle(
                      color: COLOR_TEXT,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
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
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    const Text(
                                      "Mesto",
                                      style: TextStyle(
                                          color: COLOR_TEXT, fontSize: 18),
                                    ),
                                    const SizedBox(height: 10),
                                    BorderedTextFormField(
                                      child: TextFormField(
                                        onSaved: (String? value) {
                                          city = value;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  children: [
                                    const Text(
                                      "PSČ",
                                      style: TextStyle(
                                          color: COLOR_TEXT, fontSize: 18),
                                    ),
                                    const SizedBox(height: 10),
                                    BorderedTextFormField(
                                      child: TextFormField(
                                        onSaved: (String? value) {
                                          zipCode = value;
                                        },
                                      ),
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
                                      child: TextFormField(
                                        onSaved: (String? value) {
                                          street = value;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 16),
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
                                      child: TextFormField(
                                        onSaved: (String? value) {
                                          houseNumber = value;
                                        },
                                      ),
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
                            child: TextFormField(
                              onSaved: (String? value) {
                                notes = value;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const CustomCheckboxListTile(
                        text: "pred dom", value: false),
                    const CustomCheckboxListTile(
                        text: "ku dverám", value: false),
                    const CustomCheckboxListTile(
                        text: "ku dverám bytu", value: false),
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
                                      child: TextFormField(
                                        onSaved: (String? value) {
                                          floor = value;
                                        },
                                      ),
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
                                      child: TextFormField(
                                        onSaved: (String? value) {
                                          houseNumber = value;
                                        },
                                      ),
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
                      child: const Column(
                        children: [
                          CustomCheckboxListTile(
                              text: "pri doručení (karta/hotovosť)",
                              value: false),
                          CustomCheckboxListTile(
                              text: "kartou online", value: false),
                          CustomCheckboxListTile(
                              text: "paypal / google pay / apple pay",
                              value: false),
                        ],
                      ),
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
                handleSave(houseNumber!, zipCode!, city!, floor!, notes!,
                    toHouse!, toDoors!, toFlatDoors!);
                Navigator.pushNamed(context, OrderConfirmPage.routeName);
              },
              backgroundColor: COLOR_SECONDARY,
              child:
                  const Text('Zaplatiť!', style: TextStyle(color: COLOR_TEXT)),
            ),
          ],
        ),
      ),
    );
  }
}

String idGenerator() {
  final now = DateTime.now();
  return now.microsecondsSinceEpoch.toString();
}

Future<void> handleSave(
    String houseNumber,
    String zipCode,
    String city,
    String floor,
    String notes,
    bool toHouse,
    bool toDoors,
    bool toFlatDoors) async {
  Order? order = Order(idGenerator());

  order.houseNumber = houseNumber;
  order.zipCode = zipCode;
  order.city = city;
  order.floor = floor;
  order.notes = notes;
  order.toHouse = toHouse;
  order.toDoors = toDoors;
  order.toFlatDoors = toFlatDoors;

  HttpResult<void> result;

  result = await orderService.createOrder(order);

  if (result.status == "success") {}
}
