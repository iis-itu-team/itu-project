import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
      padding: const EdgeInsets.all(10),
      height: 100,
      color: ThemeColors.colorBun,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, OrderNewPage.routeName);
              // Navigate to a different page here
            },
            child: SvgPicture.asset("assets/images/BurgerOrder.svg",
                height: 80, width: 80),
          ),
        ],
      ),
    );
  }
}
