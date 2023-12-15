import 'package:flutter/material.dart';

import 'package:food_blueprint/src/theme/theme.dart';
import 'package:food_blueprint/src/pages/order_show/order_show_controller.dart';
import 'package:food_blueprint/src/widgets/custom_app_bar.dart';

class OrderShowPage extends StatelessWidget {
  final OrderShowController controller;

  const OrderShowPage({required this.controller, super.key});

  static const routeName = '/order-show';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(text: 'Moje objednávky'),
      body: Container(
        color: COLOR_SECONDARY,
        padding: const EdgeInsets.only(left: 10),
        child: FutureBuilder(
          builder: (context, orders) {
            return ListView.builder(
              itemCount: orders.data?.length ?? 0,
              itemBuilder: (context, index) {
                if (orders.hasData) {
                  final order = orders.data?[index];

                  if (order == null) {
                    return const Text("Loading assembler...");
                  }

                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 100,
                              child: Text("${order.street}",
                                  style: const TextStyle(
                                      color: COLOR_TEXT,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 100,
                              child: Text("${order.price! / 24}€",
                                  style: const TextStyle(
                                      color: COLOR_TEXT,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                    ],
                  );
                } else {
                  return const Text("There are no data ...");
                }
              },
            );
          },
          future: controller.listOrders(),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(10),
        height: 100,
        color: COLOR_PRIMARY,
      ),
    );
  }
}

/*
*/
