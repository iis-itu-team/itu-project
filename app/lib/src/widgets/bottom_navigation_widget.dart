import 'package:flutter/material.dart';

import 'package:food_blueprint/src/theme/theme.dart';
import 'package:food_blueprint/src/pages/order_new/order_new_page.dart';

const double _edgeInsets = 10;
const double _height = 100;

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({super.key});

  @override
  BottomNavigationWidgetState createState() => BottomNavigationWidgetState();
}

class BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(_edgeInsets),
        height: _height,
        color: ThemeColors.colorBun,
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
          FloatingActionButton.large(
              onPressed: () {
                Navigator.pushNamed(context, OrderNewPage.routeName);
              },
              backgroundColor: ThemeColors.colorOnion,
              child: const Text('Objednať!',
                  style: TextStyle(color: ThemeColors.colorMeat)))
        ]));
  }
}
