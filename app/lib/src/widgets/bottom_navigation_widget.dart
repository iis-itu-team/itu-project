///
///  Author: Marek Vandík
///  Author e-mail: xvandi01@fit.vutbr.cz
///  Collaborator: Martin Otradovec - added cart functionality
///  Collaborator e-mail: xotrad00@fit.vutbr.cz
///  Date: 14. 12. 2023
///
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_blueprint/src/events/cart_item_dropped_event.dart';
import 'package:food_blueprint/src/events/cart_item_removed_event.dart';
import 'package:food_blueprint/src/models/burger.dart';
import 'package:food_blueprint/src/theme/theme.dart';
import 'package:food_blueprint/src/types/cart.dart';
import 'package:food_blueprint/src/utils/event_handler.dart';
import 'package:food_blueprint/src/widgets/cart/burger_item.dart';
import 'package:food_blueprint/src/widgets/common/image_with_fallback.dart';

import '../utils/image_loader.dart';

class BottomNavigationWidget extends StatefulWidget {
  final Cart cart;

  const BottomNavigationWidget({super.key, required this.cart});

  @override
  BottomNavigationWidgetState createState() => BottomNavigationWidgetState();
}

class BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  List<CartBurger> _items = [];

  StreamSubscription? _subs;

  @override
  void initState() {
    super.initState();
    _items = widget.cart.items;

    _subs = EventHandler.listen<CartItemRemovedEvent>((event) {
      setState(() {
        widget.cart.items.remove(event.item);
      });
    });
  }

  @override
  void dispose() {
    _subs?.cancel();
    super.dispose();
  }

  int _getTotalPrice() {
    return widget.cart.items.isEmpty
        ? 0
        : widget.cart.items
            .map((burger) => burger.burger.price! * burger.amount)
            .reduce((a, b) => a + b);
  }

  void _addItem(Burger burger) {
    setState(() {
      CartBurger carted = CartBurger(burger: burger);
      widget.cart.items.add(carted);
    });
  }

  Widget _buildCartItem(BuildContext context, CartBurger item) {
    return LongPressDraggable(
        data: item,
        onDragEnd: (details) {
          EventHandler.fire(CartItemDroppedEvent(item));
        },
        feedback: ImageWithFallback(
            key: ValueKey(item.burger.hashCode),
            icon: item.burger.icon,
            width: 80,
            height: 80,
            fallback: ImageUrlLoader.prefixUrl('/icons/burger.png')),
        child: BurgerItem(burger: item.burger));
  }

  Widget _buildCartItems(BuildContext context) {
    List<Widget> children = [Container()];

    for (var item in widget.cart.items) {
      children.add(_buildCartItem(context, item));
    }

    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Stack(children: [
          Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: children)
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        height: 120,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            color: ThemeColors.colorBun,
            border: Border(
                top: BorderSide(width: 8, color: ThemeColors.colorCheese))),
        child: Row(children: [
          Expanded(
              flex: 9,
              child: DragTarget<Burger>(builder:
                  (BuildContext context, candidateItems, rejectedItems) {
                if (_items.isEmpty) {
                  return Container(
                    decoration: BoxDecoration(
                        color: ThemeColors.colorCheese
                            .withOpacity(candidateItems.isEmpty ? 0.2 : 0.4),
                        border: Border.all(color: ThemeColors.colorCheese),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text("hoď burgry do košíku", style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          )),
                          SvgPicture.asset(
                            "assets/images/Basket.svg",
                            width: 40,
                            height: 40,
                            colorFilter: const ColorFilter.mode(
                                ThemeColors.colorCheese, BlendMode.srcIn),
                          )
                        ]),
                  );
                }

                return Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: ThemeColors.colorCheese
                            .withOpacity(candidateItems.isEmpty ? 0.2 : 0.4),
                        border: Border.all(color: ThemeColors.colorCheese),
                        borderRadius: BorderRadius.circular(10)),
                    child: _buildCartItems(context));
              }, onAccept: (Burger burger) {
                _addItem(burger);
              })),
          Expanded(
              flex: 3,
              child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text('${_getTotalPrice()} Kč',
                          style: const TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 16)))))
        ]));
  }
}
