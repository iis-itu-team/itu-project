/// Copyright (C) -> see copyright_notice.txt in root dir
///
///  Author: Martin Otradovec
///  Author e-mail: xotrad00@fit.vutbr.cz
///  Date: 17. 12. 2023
///
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_blueprint/src/pages/order_new/order_new_page.dart';
import 'package:food_blueprint/src/types/cart.dart';

class OrderButton extends StatefulWidget {
  final Cart cart;

  const OrderButton({super.key, required this.cart});

  @override
  State<StatefulWidget> createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
          child: GestureDetector(
        onTap: () {
          if (widget.cart.items.isNotEmpty) {
            Navigator.pushNamed(context, OrderNewPage.routeName);
          }
        },
        child: SvgPicture.asset("assets/images/BurgerOrder.svg",
            height: 120, width: 120),
      ))
    ]);
  }
}
