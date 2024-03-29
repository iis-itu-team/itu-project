/// Copyright (C) -> see copyright_notice.txt in root dir
///
///  Author: Matúš Hubinský
///  Author e-mail: xhubin04@fit.vutbr.cz
///  Date: 12. 12. 2023
///
import 'package:flutter/material.dart';
import 'package:food_blueprint/src/theme/theme.dart';
import 'package:food_blueprint/src/widgets/app_bar_widget.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class OrderConfirmPage extends StatelessWidget {
  const OrderConfirmPage({super.key});

  static const routeName = '/order-confirm';

  get selectedMenu => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(text: 'Potvrdenie objednávky'),
      body: Container(
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Ďakujeme",
                style: TextStyle(
                    color: ThemeColors.colorText,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              Text(
                "Vaša objednávka je na ceste!",
                style: TextStyle(
                    color: ThemeColors.colorText,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
