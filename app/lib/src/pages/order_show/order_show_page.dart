import 'package:food_blueprint/src/utils/image_loader.dart';
import 'package:food_blueprint/src/widgets/common/image_with_fallback.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:food_blueprint/src/theme/theme.dart';
import 'package:food_blueprint/src/pages/order_show/order_show_controller.dart';
import 'package:food_blueprint/src/widgets/custom_app_bar.dart';

import 'dart:developer' as developer;

class OrderShowPage extends StatelessWidget {
  final OrderShowController controller;

  const OrderShowPage({required this.controller, super.key});

  static const routeName = '/order-show';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(text: 'Moje objednávky'),
      body: Container(
        padding: const EdgeInsets.only(left: 10),
        child: FutureBuilder(
          builder: (context, orders) {
            if (orders.data == null) {
              return const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Nemáte zatím žádný objednávky",
                    style: TextStyle(
                        color: ThemeColors.colorText,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              );
            }
            return ListView.builder(
              itemCount: orders.data?.length ?? 0,
              itemBuilder: (context, index) {
                if (orders.hasData) {
                  final order = orders.data?[index];

                  if (order == null) {
                    return const Text("Nemáte zatím žádný objednávky");
                  }
                  var date = DateFormat('dd.MM')
                      .format(DateTime.parse(order.date.toString()))
                      .toString();

                  return Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(3.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(date),
                            const SizedBox(width: 10),
                            const Expanded(
                              child: Divider(
                                  thickness: 4.0,
                                  color: ThemeColors.colorMeat,
                                  indent: 5.0),
                            ),
                            const SizedBox(width: 10),
                            Text("${order.street}"),
                            const SizedBox(width: 10),
                            const Expanded(
                              child: Divider(
                                  thickness: 4.0,
                                  color: ThemeColors.colorMeat,
                                  indent: 5.0),
                            ),
                            const SizedBox(width: 10),
                            Text("${order.price!} Kč"),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 300.0,
                              height: 120.0,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: order.privateBurgers.length,
                                itemBuilder: (context, index) {
                                  final burger = order.privateBurgers[index];

                                  return Row(
                                    children: [
                                      Column(
                                        children: [
                                          Text("${burger.name}"),
                                          ImageWithFallback(
                                            icon: burger.icon,
                                            width: 80,
                                            height: 80,
                                            fallback: ImageUrlLoader.prefixUrl(
                                                '/icons/burger.png'),
                                          ),
                                          Text(
                                              "${burger.amount} x ${burger.price} Kč"),
                                        ],
                                      ),
                                      const SizedBox(width: 15),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }
                return null;
              },
            );
          },
          future: controller.listOrders(),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(10),
        height: 100,
        color: ThemeColors.colorBun,
      ),
    );
  }
}

/*
*/
