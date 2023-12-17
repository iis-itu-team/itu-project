import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_blueprint/src/pages/order_new/order_new_page.dart';

class OrderButton extends StatelessWidget {
  const OrderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
          child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, OrderNewPage.routeName);
        },
        child: SvgPicture.asset("assets/images/BurgerOrder.svg",
            height: 120, width: 120),
      ))
    ]);
  }
}
