///
///  Author: Martin Otradovec
///  Author e-mail: xotrad00@fit.vutbr.cz
///  Date: 16. 12. 2023
///
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_blueprint/src/pages/burger_edit/burger_edit_page.dart';

/// Button that creates a new burger.
class CreateBurgerButton extends StatelessWidget {
  const CreateBurgerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, BurgerEditPage.routeName);
        },
        child: SizedBox(
            width: 100,
            height: 120,
            child: Column(children: [
              const Text('Přidat burgr',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w800)),
              Expanded(
                  child: SizedBox(
                      width: 80,
                      height: 80,
                      child: SvgPicture.asset("assets/images/CreateBurger.svg",
                          height: 80, width: 80))),
              const Text("Zadarmo!",
                  style: TextStyle(fontWeight: FontWeight.w600))
            ])));
  }
}
