import 'package:flutter/material.dart';
import 'package:food_blueprint/src/events/burger_created_event.dart';
import 'package:food_blueprint/src/events/burger_updated_event.dart';
import 'package:food_blueprint/src/models/burger.dart';
import 'package:food_blueprint/src/pages/burger_edit/burger_edit_arguments.dart';
import 'package:food_blueprint/src/pages/burger_edit/burger_edit_page.dart';
import 'package:food_blueprint/src/pages/home/home_controller.dart';
import 'package:food_blueprint/src/utils/event_handler.dart';
import 'package:food_blueprint/src/utils/image_loader.dart';
import 'package:food_blueprint/src/widgets/bottom_navigation_widget.dart';
import 'package:food_blueprint/src/widgets/common/image_with_fallback.dart';
import 'package:food_blueprint/src/widgets/common/loading.dart';
import 'package:food_blueprint/src/widgets/custom_app_bar.dart';
import 'package:food_blueprint/src/widgets/custom_row_menu.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  final TextStyle linkStyle = const TextStyle(color: Colors.blue);

  final HomeController controller;

  const HomePage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(text: 'Domov'),
      body: Column(
        children: <Widget>[
          const CustomRowMenu(),
          Expanded(
            child: BurgerList(
              controller: controller,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, BurgerEditPage.routeName);
              },
              child: const Text(
                "Create new burger! (click...)",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationWidget(),
    );
  }
}

class BurgerList extends StatefulWidget {
  final HomeController controller;

  const BurgerList({super.key, required this.controller});

  @override
  State<StatefulWidget> createState() => _BurgerListState();
}

class _BurgerListState extends State<BurgerList> {
  List<Burger> _burgers = [];
  bool _loaded = false;

  Widget _buildBurgerList(BuildContext context) {
    List<Widget> children = [];

    for (int index = 0; index < _burgers.length; index++) {
      Burger burger = _burgers[index];

      children.add(GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              BurgerEditPage.routeName,
              arguments: BurgerEditArguments(burger),
            );
          },
          child: Row(children: [
            ImageWithFallback(
                key: ValueKey(burger.hashCode),
                icon: burger.icon,
                width: 80,
                height: 80,
                fallback: ImageUrlLoader.prefixUrl('/icons/burger.png')),
            Expanded(child: Text(burger.name ?? ''))
          ])));
    }

    return SingleChildScrollView(child: Column(children: children));
  }

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
      widget.controller.listBurgers(),
      Future.delayed(const Duration(milliseconds: 2000))
    ]).then((data) {
      _burgersLoaded(data[0]);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_loaded) {
      return Padding(
          padding: const EdgeInsets.all(8), child: _buildBurgerList(context));
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
  }
}
