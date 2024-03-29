/// Copyright (C) -> see copyright_notice.txt in root dir
///
///  Author: Martin Otradovec
///  Author e-mail: xotrad00@fit.vutbr.cz
///  Date: 05. 11. 2023
///
import 'package:flutter/material.dart';
import 'package:food_blueprint/src/pages/home/home_controller.dart';
import 'package:food_blueprint/src/types/cart.dart';
import 'package:food_blueprint/src/widgets/app_bar_widget.dart';
import 'package:food_blueprint/src/widgets/bottom_navigation_widget.dart';
import 'package:food_blueprint/src/widgets/cart/cart_drop_provider.dart';
import 'package:food_blueprint/src/widgets/cart/order_button.dart';
import 'package:food_blueprint/src/widgets/common/burger_listing.dart';
import 'package:food_blueprint/src/widgets/common/create_burger.dart';
import 'package:food_blueprint/src/widgets/row_menu_widget.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  final TextStyle linkStyle = const TextStyle(color: Colors.blue);

  final HomeController controller;

  final LayerLink layerLink = LayerLink();

  final Cart cart;

  HomePage({super.key, required this.controller, required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(text: 'Domov'),
      body: CartDropProvider(
          layerLink: layerLink,
          child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: <Widget>[
                  const RowMenuWidget(),
                  Expanded(
                      child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(children: [
                            BurgerList(
                                limit: 10,
                                displayLoadingScreen: !controller.isCached(),
                                fetchBurgers: controller.listMyBurgers,
                                title: "moje burgříky",
                                extraChildren: const [CreateBurgerButton()]),
                            BurgerList(
                                limit: 10,
                                displayLoadingScreen: !controller.isCached(),
                                fetchBurgers: controller.listCommunityBurgers,
                                title: "komunitní burgříky"),
                            // extra padding to scroll content from behind the order button
                            const SizedBox(height: 120)
                          ])))
                ],
              ))),
      bottomNavigationBar: BottomNavigationWidget(cart: cart),
      floatingActionButton: OrderButton(cart: cart),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
