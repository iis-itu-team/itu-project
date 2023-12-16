import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_blueprint/src/models/order.dart';
import 'package:food_blueprint/src/services/order_service.dart';
import 'package:food_blueprint/src/theme/theme.dart';
import 'package:food_blueprint/src/pages/order_new/order_new_controller.dart';
import 'package:food_blueprint/src/pages/order_new/order_confirm_page.dart';
import 'package:food_blueprint/src/widgets/custom_app_bar.dart';
import 'package:food_blueprint/src/widgets/custom_checkbox.dart';
import 'package:food_blueprint/src/widgets/custom_text_form.dart';

import 'package:food_blueprint/src/widgets/header_widget.dart';

late final OrderService orderService;
final Order order = Order();

final Map<String, TextEditingController> sigUpController = {
  'city': TextEditingController(),
  'street': TextEditingController(),
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
    final res = <String, dynamic>{};
    for (MapEntry e in entries) {
      res.putIfAbsent(e.key, () => e.value?.text);
    }
    return res;
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
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderWidget(text: "shrnututí"),
              HeaderWidget(text: "doručení"),
              CustomTextForm(
                  text: "Město", controller: sigUpController['city']),
              CustomTextForm(
                  text: "Ulice", controller: sigUpController['street']),
              CustomTextForm(
                  text: "č.p.", controller: sigUpController['houseNumber']),
              CustomTextForm(
                  text: "poznámka pro řidiče",
                  controller: sigUpController['note']),
              const CustomCheckboxListTile(text: "před dum", value: false),
              const CustomCheckboxListTile(
                  text: "ke dveřím domu", value: false),
              const CustomCheckboxListTile(
                  text: "ke dveřím bytu", value: false),
              CustomTextForm(
                  text: "patro", controller: sigUpController['floor']),
              CustomTextForm(
                  text: "číslo bytu",
                  controller: sigUpController['flatNumber']),
              const CustomCheckboxListTile(text: "zazvonit", value: false),
              HeaderWidget(text: "platba"),
              const CustomCheckboxListTile(
                  text: "při doručení (hotově / kartou)", value: false),
              const CustomCheckboxListTile(text: "online kartou", value: false),
              const CustomCheckboxListTile(text: "paypal", value: false),
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

                order.city = data['city'];
                order.street = data['street'];
                order.houseNumber = data['houseNumber'];
                order.flatNumber = data['flatNumber'];
                order.postalCode = data['postalCode'];
                order.floor = data['floor'];
                order.note = data['note'];

                controller.handleSave(order);

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
