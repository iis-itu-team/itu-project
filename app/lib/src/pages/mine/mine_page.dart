import 'package:flutter/material.dart';
import 'package:food_blueprint/src/pages/home/home_controller.dart';
import 'package:food_blueprint/src/pages/mine/mine_controller.dart';
import 'package:food_blueprint/src/types/cart.dart';
import 'package:food_blueprint/src/widgets/bottom_navigation_widget.dart';
import 'package:food_blueprint/src/widgets/common/burger_listing.dart';
import 'package:food_blueprint/src/widgets/common/create_burger.dart';
import 'package:food_blueprint/src/widgets/custom_app_bar.dart';
import 'package:food_blueprint/src/widgets/custom_row_menu.dart';

class MinePage extends StatelessWidget {
  static const routeName = '/mine';

  final TextStyle linkStyle = const TextStyle(color: Colors.blue);

  final MineController mineController;
  final HomeController homeController;

  final Cart cart;

  const MinePage(
      {super.key,
      required this.mineController,
      required this.homeController,
      required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(text: 'Moje'),
        body: Column(children: [
          const CustomRowMenu(),
          Expanded(
              child: BurgerList(
            fetchBurgers: mineController.listBurgers,
            extraChildren: const [CreateBurgerButton()],
          ))
        ]),
        bottomNavigationBar: BottomNavigationWidget(cart: cart));
  }
}
