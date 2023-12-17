/// Copyright (C) -> see copyright_notice.txt in root dir
///
///  Author: Martin Otradovec
///  Author e-mail: xotrad00@fit.vutbr.cz
///  Date: 14. 12. 2023
///
import 'package:flutter/material.dart';
import 'package:food_blueprint/src/pages/home/home_controller.dart';
import 'package:food_blueprint/src/pages/mine/mine_controller.dart';
import 'package:food_blueprint/src/types/cart.dart';
import 'package:food_blueprint/src/widgets/app_bar_widget.dart';
import 'package:food_blueprint/src/widgets/bottom_navigation_widget.dart';
import 'package:food_blueprint/src/widgets/cart/cart_drop_provider.dart';
import 'package:food_blueprint/src/widgets/cart/order_button.dart';
import 'package:food_blueprint/src/widgets/common/burger_listing.dart';
import 'package:food_blueprint/src/widgets/common/create_burger.dart';
import 'package:food_blueprint/src/widgets/row_menu_widget.dart';

class MinePage extends StatelessWidget {
  static const routeName = '/mine';

  final TextStyle linkStyle = const TextStyle(color: Colors.blue);

  final MineController mineController;
  final HomeController homeController;

  final Cart cart;
  final LayerLink layerLink;

  MinePage(
      {super.key,
      required this.mineController,
      required this.homeController,
      required this.cart})
      : layerLink = LayerLink();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(text: 'Moje'),
      body: CartDropProvider(
          layerLink: layerLink,
          child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(children: [
                    const RowMenuWidget(),
                    BurgerList(
                      fetchBurgers: mineController.listBurgers,
                      extraChildren: const [CreateBurgerButton()],
                    ),
                    const SizedBox(height: 120)
                  ])))),
      bottomNavigationBar: BottomNavigationWidget(cart: cart),
      floatingActionButton: const OrderButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
