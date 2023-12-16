import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_blueprint/src/widgets/custom_text_form.dart';
import 'package:food_blueprint/src/services/order_service.dart';
import 'package:food_blueprint/src/theme/theme.dart';
import 'package:food_blueprint/src/pages/order_new/order_new_controller.dart';
import 'package:food_blueprint/src/pages/order_new/order_confirm_page.dart';
import 'package:food_blueprint/src/widgets/custom_app_bar.dart';
import 'package:food_blueprint/src/widgets/custom_checkbox.dart';

import 'dart:developer' as developer;

import 'package:food_blueprint/src/widgets/header_widget.dart';

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

String? city = '';
String? street = '';
String? houseNumber = '';
String? zipCode = '';
int? flatNumber = 0;
String? floor = '';
String? notes = '';
bool? ring = false;
bool? toHouse = false;
bool? toDoors = false;
bool? toFlatDoors = false;

late final OrderService orderService;

class OrderNewPage extends StatelessWidget {
  final OrderNewController controller;

  const OrderNewPage({required this.controller, super.key});

  static const routeName = '/order-new';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(text: 'Nová objednávka'),
      body: Container(
        padding: const EdgeInsets.only(left: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderWidget(text: "shrnututí"),
              Column(
                children: [
                  HeaderWidget(text: "doručení"),
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
                                        color: ThemeColors.colorMeat,
                                        fontSize: 25),
                                  ),
                                  const SizedBox(height: 10),
                                  CustomTextForm(variable: city),
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
                                        color: ThemeColors.colorMeat,
                                        fontSize: 25),
                                  ),
                                  const SizedBox(height: 10),
                                  CustomTextForm(variable: zipCode),
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
                                        color: ThemeColors.colorMeat,
                                        fontSize: 25),
                                  ),
                                  const SizedBox(height: 10),
                                  CustomTextForm(variable: street),
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
                                        color: ThemeColors.colorMeat,
                                        fontSize: 25),
                                  ),
                                  const SizedBox(height: 10),
                                  CustomTextForm(variable: houseNumber),
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
                          style: TextStyle(
                              color: ThemeColors.colorMeat, fontSize: 25),
                        ),
                        const SizedBox(height: 10),
                        CustomTextForm(variable: notes),
                      ],
                    ),
                  ),
                  const CustomCheckboxListTile(text: "pred dom", value: false),
                  const CustomCheckboxListTile(text: "ku dverám", value: false),
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
                                        color: ThemeColors.colorMeat,
                                        fontSize: 25),
                                  ),
                                  const SizedBox(height: 10),
                                  CustomTextForm(variable: floor),
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
                                        color: ThemeColors.colorMeat,
                                        fontSize: 25),
                                  ),
                                  const SizedBox(height: 10),
                                  CustomTextForm(variable: houseNumber),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: const Column(
                            children: [
                              CustomCheckboxListTile(
                                  text: "zazvoniť", value: false),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  HeaderWidget(text: "platba"),
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(10),
        height: 100,
        color: ThemeColors.colorBun,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                developer.log("here");
                developer.log(houseNumber!);
                developer.log(zipCode!);
                developer.log("end");
                controller.handleSave(
                    houseNumber!,
                    street!,
                    zipCode!,
                    city!,
                    floor!,
                    flatNumber!,
                    notes!,
                    ring!,
                    toHouse!,
                    toDoors!,
                    toFlatDoors!);
                Navigator.pushNamed(context, OrderConfirmPage.routeName);
              },
              child: SvgPicture.asset("assets/images/BurgerOrder.svg",
                  height: 80, width: 80),
            ),
          ],
        ),
      ),
    );
  }
}
