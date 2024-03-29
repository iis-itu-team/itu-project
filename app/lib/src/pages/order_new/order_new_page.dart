/// Copyright (C) -> see copyright_notice.txt in root dir
///
///  Author: Matúš Hubinský
///  Author e-mail: xhubin04@fit.vutbr.cz
///  Date: 12. 12. 2023
///
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_blueprint/src/models/burger.dart';
import 'package:food_blueprint/src/models/order.dart';
import 'package:food_blueprint/src/services/order_service.dart';
import 'package:food_blueprint/src/theme/theme.dart';
import 'package:food_blueprint/src/pages/order_new/order_new_controller.dart';
import 'package:food_blueprint/src/pages/order_new/order_confirm_page.dart';
import 'package:food_blueprint/src/utils/image_loader.dart';
import 'package:food_blueprint/src/widgets/app_bar_widget.dart';
import 'package:food_blueprint/src/widgets/cart/burger_item.dart';
import 'package:food_blueprint/src/widgets/checkbox_widget.dart';
import 'package:food_blueprint/src/widgets/common/image_with_fallback.dart';
import 'package:food_blueprint/src/widgets/text_form_widget.dart';

import 'package:food_blueprint/src/widgets/header_widget.dart';
import 'package:food_blueprint/src/widgets/three_checkboxs_widget.dart';

import 'package:food_blueprint/src/types/cart.dart';

late final OrderService orderService;
Order order = Order();

final Map<String, TextEditingController> sigUpController = {
  'city': TextEditingController(),
  'street': TextEditingController(),
  'houseNumber': TextEditingController(),
  'postalCode': TextEditingController(),
  'flatNumber': TextEditingController(),
  'floor': TextEditingController(),
  'note': TextEditingController(),
  'ring': TextEditingController(),
  'deliveryType': TextEditingController(),
  'paymentType': TextEditingController(),
};

extension Data on Map<String, TextEditingController> {
  Map<String, dynamic> data() {
    final result = <String, dynamic>{};
    for (MapEntry e in entries) {
      result.putIfAbsent(e.key, () => e.value?.text);
    }
    return result;
  }
}

class OrderNewPage extends StatefulWidget {
  final OrderNewController controller;
  Cart cart = Cart();

  OrderNewPage({
    required this.controller,
    super.key,
    required this.cart,
  });

  static const routeName = '/order-new';

  @override
  State<OrderNewPage> createState() => _OrderNewPageState();
}

class _OrderNewPageState extends State<OrderNewPage> {
  String payment = "cash";
  String delivery = "house";

  callbackPayment(variable) async {
    setState(() {
      payment = variable;
    });
  }

  callbackDelivery(variable) async {
    setState(() {
      delivery = variable;
    });
  }

  Widget _builderBurgerIcon(BuildContext context, CartBurger item) => Column(
        children: [
          Text("${item.burger.name}"),
          ImageWithFallback(
            icon: item.burger.icon,
            width: 80,
            height: 80,
            fallback: ImageUrlLoader.prefixUrl('/icons/burger.png'),
          ),
          Text("${item.burger.price} Kč"),
        ],
      );

  Widget _buildBurgerRow(BuildContext context) {
    return Container(
      child: Row(
        children: widget.cart.items
            .map((item) => _builderBurgerIcon(context, item))
            .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(text: 'Nová objednávka'),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderWidget(text: "shrnututí"),
              Column(
                children: [_buildBurgerRow(context)],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "celkem:${widget.cart.getTotalPrice()}Kč",
                    style: const TextStyle(
                        color: ThemeColors.colorMeat,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              HeaderWidget(text: "doručení"),
              TextFormWidget(
                  text: "Město", controller: sigUpController['city']),
              const SizedBox(height: 10),
              TextFormWidget(
                  text: "Ulice", controller: sigUpController['street']),
              const SizedBox(height: 10),
              TextFormWidget(
                  text: "č.p.", controller: sigUpController['houseNumber']),
              const SizedBox(height: 10),
              TextFormWidget(
                  text: "PSČ", controller: sigUpController['postalCode']),
              const SizedBox(height: 10),
              TextFormWidget(
                  text: "poznámka pro řidiče",
                  controller: sigUpController['note']),
              ThreeCheckboxsWidget(
                text1: "před dum",
                text2: "ke dveřím domu",
                text3: "ke dveřím bytu",
                callbackFunction: callbackDelivery,
              ),
              TextFormWidget(
                  text: "patro", controller: sigUpController['floor']),
              const SizedBox(height: 10),
              TextFormWidget(
                  text: "číslo bytu",
                  controller: sigUpController['flatNumber']),
              const CheckBoxWidget(text: "zazvonit", value: false),
              HeaderWidget(text: "platba"),
              ThreeCheckboxsWidget(
                text1: "při doručení (hotově / kartou)",
                text2: "online kartou",
                text3: "paypal",
                callbackFunction: callbackPayment,
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
                final data = sigUpController.data();

                List<Burger> burgers = [];
                for (CartBurger item in widget.cart.items) {
                  burgers.add(item.burger as Burger);
                }

                order.burgers = burgers;
                order.city = data['city'];
                order.street = data['street'];
                order.houseNumber = data['houseNumber'];
                order.flatNumber = data['flatNumber'];
                order.postalCode = data['postalCode'];
                order.floor = data['floor'];
                order.note = data['note'];

                switch (payment) {
                  case ("při doručení (hotově / kartou)"):
                    payment = "on_delivery";
                    break;
                  case ("online kartou"):
                    payment = "card";
                    break;
                  case ("při doručení (hotově / kartou)"):
                    payment = "paypal";
                    break;
                }

                order.paymentType = payment;

                switch (delivery) {
                  case ("před dum"):
                    delivery = "house";
                    break;
                  case ("ke dveřím domu"):
                    delivery = "house_door";
                    break;
                  case ("ke dveřím bytu"):
                    delivery = "flat_door";
                    break;
                }

                order.deliveryType = delivery;

                widget.controller.handleSave(order);

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
