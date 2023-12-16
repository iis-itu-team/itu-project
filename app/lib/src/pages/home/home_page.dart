import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_blueprint/src/events/cart_item_dropped.dart';
import 'package:food_blueprint/src/events/cart_item_removed.dart';
import 'package:food_blueprint/src/pages/home/home_controller.dart';
import 'package:food_blueprint/src/pages/order_new/order_new_page.dart';
import 'package:food_blueprint/src/types/cart.dart';
import 'package:food_blueprint/src/utils/event_handler.dart';
import 'package:food_blueprint/src/utils/keeper_store.dart';
import 'package:food_blueprint/src/widgets/bottom_navigation_widget.dart';
import 'package:food_blueprint/src/widgets/common/burger_listing.dart';
import 'package:food_blueprint/src/widgets/common/create_burger.dart';
import 'package:food_blueprint/src/widgets/custom_app_bar.dart';
import 'package:food_blueprint/src/widgets/custom_row_menu.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  final TextStyle linkStyle = const TextStyle(color: Colors.blue);

  final HomeController controller;

  OverlayEntry? overlayEntry;
  final LayerLink layerLink = LayerLink();

  final Cart cart;

  HomePage({super.key, required this.controller, required this.cart});

  Widget _buildPage(BuildContext context) {
    return Column(
      children: <Widget>[
        const CustomRowMenu(),
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
      appBar: const CustomAppBar(text: 'Domov'),
      body: CompositedTransformTarget(
          link: layerLink,
          child: DragTarget<CartBurger>(onWillAccept: (item) {
            return false;
          }, builder: (context, candidateItems, rejectedItems) {
            if (rejectedItems.isNotEmpty) {
              SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                if (overlayEntry == null) {
                  overlayEntry = OverlayEntry(builder: (context) {
                    return Positioned(
                        top: 0,
                        left: 0,
                        child: CompositedTransformFollower(
                            link: layerLink,
                            offset: Offset(
                                MediaQuery.of(context).size.width / 6,
                                MediaQuery.of(context).size.height / 3),
                            child: DragTarget<CartBurger>(onAccept: (item) {
                              EventHandler.fire(CartItemRemoved(item));

                              overlayEntry?.remove();
                              overlayEntry?.dispose();
                              overlayEntry = null;
                            }, builder:
                                (context, candidateItems, rejectedItems) {
                              return Container(
                                  width:
                                      MediaQuery.of(context).size.width * 4 / 6,
                                  height: 200,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.red),
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.red.withOpacity(
                                          candidateItems.isEmpty ? 0.1 : 0.4)),
                                  child: Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                    const Text("Zahodit",
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 16,
                                        )),
                                    SvgPicture.asset("assets/images/Trash.svg",
                                        width: 80, height: 80),
                                  ])));
                            })));
                  });
                  Overlay.of(context).insert(overlayEntry!);

                  EventHandler.listen<CartItemDropped>((event) {
                    overlayEntry?.remove();
                    overlayEntry?.dispose();
                    overlayEntry = null;
                  });
                }
              });
            }

            return _buildPage(context);
          })),
      bottomNavigationBar: BottomNavigationWidget(cart: cart),
      floatingActionButton: Stack(children: [
        Positioned(
            child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, OrderNewPage.routeName);
          },
          child: SvgPicture.asset("assets/images/BurgerOrder.svg",
              height: 120, width: 120),
        ))
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
