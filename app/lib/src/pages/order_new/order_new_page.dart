import 'package:flutter/material.dart';
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

class OrderNewPage extends StatelessWidget {
  final OrderNewController controller;

  const OrderNewPage({required this.controller, super.key});

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
                                      child: TextField(
                                        onChanged: controller.handleTextUpdate,
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
                            child: TextFormField(),
                          ),
                        ],
                      ),
                    ),
                    const CustomCheckboxListTile(text: "pred dom"),
                    const CustomCheckboxListTile(text: "ku dverám"),
                    const CustomCheckboxListTile(text: "ku dverám bytu"),
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
                      child: const Column(
                        children: [
                          CustomCheckboxListTile(
                              text: "pri doručení (karta/hotovosť)"),
                          CustomCheckboxListTile(text: "kartou online"),
                          CustomCheckboxListTile(
                              text: "paypal / google pay / apple pay"),
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
