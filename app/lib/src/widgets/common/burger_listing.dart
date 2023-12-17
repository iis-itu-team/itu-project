/// Copyright (C) -> see copyright_notice.txt in root dir
///
///  Author: Martin Otradovec
///  Author e-mail: xotrad00@fit.vutbr.cz
///  Date: 16. 12. 2023
///
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_blueprint/src/events/burger_created_event.dart';
import 'package:food_blueprint/src/events/burger_deleted_event.dart';
import 'package:food_blueprint/src/events/burger_updated_event.dart';
import 'package:food_blueprint/src/models/burger.dart';
import 'package:food_blueprint/src/pages/burger_edit/burger_edit_arguments.dart';
import 'package:food_blueprint/src/pages/burger_edit/burger_edit_page.dart';
import 'package:food_blueprint/src/pages/mine/mine_page.dart';
import 'package:food_blueprint/src/utils/event_handler.dart';
import 'package:food_blueprint/src/utils/image_loader.dart';
import 'package:food_blueprint/src/utils/keeper_store.dart';
import 'package:food_blueprint/src/widgets/cart/burger_item.dart';
import 'package:food_blueprint/src/widgets/common/image_with_fallback.dart';
import 'package:food_blueprint/src/widgets/common/loading.dart';

/// Shows a list of burgers.
class BurgerList extends StatefulWidget {
  // Function to call to fetch burgers
  final Future<List<Burger>> Function() fetchBurgers;

  final String? title;

  // How many burgers to display
  final int? limit;

  // Extra children to display after the burgers in the Wrap
  final List<Widget>? extraChildren;

  // Whether to display a loading screen when burgers are loading
  final bool displayLoadingScreen;

  const BurgerList(
      {super.key,
      required this.fetchBurgers,
      this.displayLoadingScreen = true,
      this.title,
      this.extraChildren,
      this.limit});

  @override
  State<StatefulWidget> createState() => _BurgerListState();
}

class _BurgerListState extends State<BurgerList> {
  List<Burger> _burgers = [];
  bool _loaded = false;

  final List<StreamSubscription> _subs = [];

  @override
  void dispose() {
    EventHandler.cancelAll(_subs);
    _subs.clear();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _fetchList();

    // Listen to burger updates and creations, update the list
    _subs.add(EventHandler.listen<BurgerCreatedEvent>((event) {
      Burger burger = event.burger;

      setState(() {
        _burgers.insert(0, burger);
      });
    }));

    _subs.add(EventHandler.listen<BurgerUpdatedEvent>((event) {
      // find index of the burger that got updated
      Burger burger = event.burger;

      int idx = _burgers.indexWhere((element) => element.id == burger.id);

      if (idx == -1) {
        // fail to find it, re-fetch all burgers
        _fetchList();
        return;
      }

      setState(() {
        _burgers[idx] = burger;
      });
    }));

    _subs.add(EventHandler.listen<BurgerDeletedEvent>((event) {
      Burger burger = event.burger;

      setState(() {
        _burgers.removeWhere((element) => element.id == burger.id);
      });
    }));
  }

  void _burgersLoaded(List<Burger> burgers) {
    setState(() {
      _loaded = true;
      _burgers = burgers;
    });
  }

  // burgers started loading
  void _burgersLoading() {
    setState(() {
      _loaded = false;
      _burgers = [];
    });
  }

  void _fetchList() {
    _burgersLoading();
    Future.wait([
      widget.fetchBurgers(),
    ]).then((data) {
      _burgersLoaded(data[0]);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> content;

    if (_loaded || !widget.displayLoadingScreen) {
      content = [
        _buildListing(context),
        const SizedBox(height: 20),
        Visibility(
            visible: widget.limit != null && _burgers.length > widget.limit!,
            child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, MinePage.routeName);
                        },
                        child: Text(
                            "procházet dalších ${_burgers.length - (widget.limit ?? 0)}...",
                            style: const TextStyle(
                                fontWeight: FontWeight.w800)))))),
      ];
    } else {
      content = [const Center(child: Loading(text: 'Loading burgers...'))];
    }

    return Column(children: [
      widget.title != null
          ? _buildSeparator(context, widget.title!)
          : Container(),
      const SizedBox(
        height: 20,
      ),
      ...content
    ]);
  }

  Widget _buildBurgerItem(BuildContext context, Burger burger) {
    return LongPressDraggable(
        delay: const Duration(milliseconds: 150),
        data: burger,
        dragAnchorStrategy: (object, context, offset) {
          return const Offset(40, 40);
        },
        feedback: ImageWithFallback(
            key: ValueKey(burger.hashCode),
            icon: burger.icon,
            width: 80,
            height: 80,
            fallback: ImageUrlLoader.prefixUrl('/icons/burger.png')),
        child: GestureDetector(
            child: BurgerItem(burger: burger),
            onTap: () {
              // only allow to enter the editor if we're the owner of the burger
              KeeperStore.getKeeperId().then((keeperId) {
                if (keeperId == burger.keeperId) {
                  Navigator.pushNamed(context, BurgerEditPage.routeName,
                      arguments: BurgerEditArguments(burger));
                }
              });
            }));
  }

  Widget _buildSeparator(BuildContext context, String title) {
    return Row(children: [
      const SizedBox(
        width: 20,
      ),
      Text(title, style: const TextStyle(fontWeight: FontWeight.w800)),
      const SizedBox(
        width: 20,
      ),
      Expanded(
          child: Container(
              height: 4,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).textTheme.bodyMedium!.color,
              ))),
      const SizedBox(
        width: 20,
      ),
    ]);
  }

  Widget _buildListing(BuildContext context) {
    List<Widget> children = _burgers
        .take(widget.limit ?? _burgers.length)
        .map((burger) => _buildBurgerItem(context, burger))
        .toList();

    if (widget.extraChildren != null) {
      children.addAll(widget.extraChildren!);
    }

    return Wrap(direction: Axis.horizontal, children: children);
  }
}
