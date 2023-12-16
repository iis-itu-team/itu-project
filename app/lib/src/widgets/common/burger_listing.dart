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
import 'package:food_blueprint/src/widgets/common/image_with_fallback.dart';
import 'package:food_blueprint/src/widgets/common/loading.dart';

class BurgerList extends StatefulWidget {
  final Future<List<Burger>> Function() fetchBurgers;

  final int? limit;
  final List<Widget>? extraChildren;
  final String? title;

  const BurgerList(
      {super.key,
      required this.fetchBurgers,
      this.title,
      this.extraChildren,
      this.limit});

  @override
  State<StatefulWidget> createState() => _BurgerListState();
}

class _BurgerListState extends State<BurgerList> {
  List<Burger> _burgers = [];
  bool _loaded = false;

  void _burgersLoaded(List<Burger> burgers) {
    setState(() {
      _loaded = true;
      _burgers = burgers;
    });
  }

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
      Future.delayed(const Duration(milliseconds: 2000))
    ]).then((data) {
      _burgersLoaded(data[0]);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_loaded) {
      return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            BurgerListing(
                burgers: _burgers,
                title: widget.title,
                limit: widget.limit,
                extraChildren: widget.extraChildren),
            const SizedBox(height: 20),
            Visibility(
                visible:
                    widget.limit != null && _burgers.length > widget.limit!,
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
          ]));
    }

    return const Center(child: Loading(text: 'Loading burgers...'));
  }

  @override
  void initState() {
    super.initState();
    _fetchList();

    // Listen to burger updates and creations, update the list
    EventHandler.listen<BurgerCreatedEvent>((event) {
      Burger burger = event.burger;

      setState(() {
        _burgers.add(burger);
      });
    });

    EventHandler.listen<BurgerUpdatedEvent>((event) {
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
    });

    EventHandler.listen<BurgerDeletedEvent>((event) {
      Burger burger = event.burger;

      setState(() {
        _burgers.removeWhere((element) => element.id == burger.id);
      });
    });
  }
}

class BurgerListing extends StatefulWidget {
  final List<Burger> burgers;
  final int? limit;
  final List<Widget>? extraChildren;
  final String? title;

  const BurgerListing(
      {super.key,
      this.title,
      required this.burgers,
      this.limit,
      this.extraChildren});

  @override
  State<StatefulWidget> createState() => _BurgerListingState();
}

class _BurgerListingState extends State<BurgerListing> {
  Widget _buildBurgerItem(BuildContext context, Burger burger) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            BurgerEditPage.routeName,
            arguments: BurgerEditArguments(burger),
          );
        },
        child: SizedBox(
            width: 100,
            height: 120,
            child: Column(children: [
              Text(burger.name ?? '',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.w800)),
              Expanded(
                  child: ImageWithFallback(
                      key: ValueKey(burger.hashCode),
                      icon: burger.icon,
                      width: 80,
                      height: 80,
                      fallback: ImageUrlLoader.prefixUrl('/icons/burger.png'))),
              Text('${burger.price} Kč', textAlign: TextAlign.end)
            ])));
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

  @override
  Widget build(BuildContext context) {
    List<Widget> children = widget.burgers
        .take(widget.limit ?? widget.burgers.length)
        .map((burger) => _buildBurgerItem(context, burger))
        .toList();

    if (widget.extraChildren != null) {
      children.addAll(widget.extraChildren!);
    }

    return Column(children: [
      widget.title != null
          ? _buildSeparator(context, widget.title!)
          : Container(),
      const SizedBox(
        height: 20,
      ),
      Wrap(direction: Axis.horizontal, children: children)
    ]);
  }
}