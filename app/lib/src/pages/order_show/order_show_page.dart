import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:food_blueprint/src/theme/theme.dart';
import 'package:food_blueprint/src/pages/order_show/order_show_controller.dart';
import 'package:food_blueprint/src/widgets/custom_app_bar.dart';
import 'package:food_blueprint/src/widgets/custom_order_text.dart';

import 'dart:developer' as developer;

const Image _defaultImage =
    Image(image: AssetImage('assets/images/flutter_logo.png'));

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

                  developer.log(order.privateBurgers[0].price.toString());

                  return Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Colors.black,
                          width: 5.0,
                        ),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(
                              5.0) //                 <--- border radius here
                          ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomOrderText(input: date),
                            CustomOrderText(input: "${order.street}"),
                            CustomOrderText(input: "${order.price!} Kč"),
                          ],
                        ),
                        Row(
                          children: [
                            CustomOrderText(
                                input: "${order.privateBurgers[0].name}"),
                          ],
                        ),
                        Row(
                          children: [
                            Flexible(
                                flex: 3,
                                child: order.privateBurgers[0].image != null
                                    ? Image.network(
                                        '${order.privateBurgers[0].image}',
                                        loadingBuilder: (BuildContext context,
                                            Widget child,
                                            ImageChunkEvent? loadingProgress) {
                                          return CircularProgressIndicator(
                                            value: (loadingProgress
                                                        ?.cumulativeBytesLoaded ??
                                                    0) /
                                                (loadingProgress
                                                        ?.expectedTotalBytes ??
                                                    100000000),
                                          );
                                        },
                                      )
                                    : _defaultImage),
                          ],
                        ),
                        Row(
                          children: [
                            CustomOrderText(
                                input: "${order.privateBurgers[0].price} Kč"),
                          ],
                        ),
                      ],
                    ),
                  );
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
        color: ThemeColors.colorBun,
      ),
    );
  }
}

/*
*/
