///
///  Author: Martin Otradovec
///  Author e-mail: xotrad00@fit.vutbr.cz
///  Date: 05. 11. 2023
///
import 'package:flutter/material.dart';
import 'package:food_blueprint/src/pages/home/home_controller.dart';
import 'package:food_blueprint/src/types/cart.dart';
import 'package:food_blueprint/src/utils/keeper_store.dart';
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

  Widget _buildPage(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                const RowMenuWidget(),
                BurgerList(
                    limit: 10,
                    fetchBurgers: () {
                      return controller.listBurgers().then((burgers) async {
                        String? keeperId = await KeeperStore.getKeeperId();

                        if (keeperId == null) {
                          return [];
                        }

                        burgers = burgers
                            .where((element) => element.keeperId == keeperId)
                            .toList();

                        burgers.sort((a, b) => a.createdAt != null &&
                                b.createdAt != null &&
                                a.createdAt!.isBefore(b.createdAt!)
                            ? 1
                            : -1);

                        return burgers;
                      });
                    },
                    title: "moje burgříky",
                    extraChildren: const [CreateBurgerButton()]),
                BurgerList(
                    limit: 10,
                    fetchBurgers: () {
                      return controller.listBurgers().then((burgers) async {
                        String? keeperId = await KeeperStore.getKeeperId();

                        if (keeperId == null) {
                          return [];
                        }

                        burgers = burgers
                            .where((element) =>
                                element.published == true &&
                                keeperId != element.keeperId)
                            .toList();

                        burgers.sort((a, b) => a.rating != null &&
                                b.rating != null &&
                                a.rating! > b.rating!
                            ? -1
                            : 1);
                        return burgers;
                      });
                    },
                    title: "komunitní burgříky"),
                // extra padding to scroll content from behind the order button
                const SizedBox(height: 120)
              ],
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(text: 'Domov'),
      body: CartDropProvider(layerLink: layerLink, child: _buildPage(context)),
      bottomNavigationBar: BottomNavigationWidget(cart: cart),
      floatingActionButton: const OrderButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
