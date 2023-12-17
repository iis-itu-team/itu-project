import 'package:flutter/material.dart';
import 'package:food_blueprint/src/pages/home/home_controller.dart';
import 'package:food_blueprint/src/types/cart.dart';
import 'package:food_blueprint/src/utils/keeper_store.dart';
import 'package:food_blueprint/src/widgets/bottom_navigation_widget.dart';
import 'package:food_blueprint/src/widgets/cart/cart_drop_provider.dart';
import 'package:food_blueprint/src/widgets/cart/order_button.dart';
import 'package:food_blueprint/src/widgets/common/burger_listing.dart';
import 'package:food_blueprint/src/widgets/common/create_burger.dart';
import 'package:food_blueprint/src/widgets/app_bar_widget.dart';
import 'package:food_blueprint/src/widgets/row_menu_widget.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  final TextStyle linkStyle = const TextStyle(color: Colors.blue);

  final HomeController controller;

  final LayerLink layerLink = LayerLink();

  final Cart cart;

  HomePage({super.key, required this.controller, required this.cart});

  Widget _buildPage(BuildContext context) {
    return Column(
      children: <Widget>[
        const RowMenuWidget(),
        Expanded(
          child: BurgerList(
              limit: 10,
              fetchBurgers: () {
                return controller.listBurgers().then((burgers) async {
                  String? keeperId = await KeeperStore.getKeeperId();

                  if (keeperId == null) {
                    return [];
                  }

                  return burgers
                      .where((element) => element.keeperId == keeperId)
                      .toList();
                });
              },
              title: "moje burgříky",
              extraChildren: const [CreateBurgerButton()]),
        )
      ],
    );
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
