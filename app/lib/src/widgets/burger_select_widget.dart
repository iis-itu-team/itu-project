///
///  Author: Marek Vandík
///  Author e-mail: xvandi01@fit.vutbr.cz
///  Date: 16. 12. 2023
///
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:food_blueprint/src/models/burger.dart';
import 'package:food_blueprint/src/pages/burger_edit/burger_edit_page.dart';
import 'package:food_blueprint/src/pages/burger_edit/burger_edit_arguments.dart';
import 'package:food_blueprint/src/theme/theme.dart';
import 'package:food_blueprint/src/utils/image_loader.dart';
import 'package:food_blueprint/src/widgets/common/image_with_fallback.dart';

const double _burgerHeight = 100;
const double _burgerWidth = 90;
const double _borderWidth = 2;
const double _borderRadius = 3;

const double _selectButtonSize = 16;

final Widget _radioButton = SvgPicture.asset(
  'assets/images/RadioButton.svg',
  height: _selectButtonSize,
  width: _selectButtonSize,
);
final Widget _radioButtonSelected = SvgPicture.asset(
  'assets/images/RadioButtonSelected.svg',
  height: _selectButtonSize,
  width: _selectButtonSize,
);

class BurgerSelectWidget extends StatefulWidget {
  const BurgerSelectWidget(
      {super.key, required this.burger, required this.onSelect});

  final Burger burger;
  final Function(Burger, bool) onSelect;

  static const height = _burgerHeight;
  static const width = _burgerWidth;

  @override
  BurgerSelectWidgetState createState() => BurgerSelectWidgetState();
}

class BurgerSelectWidgetState extends State<BurgerSelectWidget> {
  late Burger burger;
  bool selected = false;

  @override
  void initState() {
    super.initState();
    burger = widget.burger;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: _burgerHeight,
        width: _burgerWidth,
        constraints: const BoxConstraints(
            maxHeight: _burgerHeight, maxWidth: _burgerWidth),
        decoration: BoxDecoration(
            color: ThemeColors.colorOnion,
            border:
                Border.all(width: _borderWidth, color: ThemeColors.colorMeat),
            borderRadius: BorderRadius.circular(_borderRadius)),
        child: Column(children: <Widget>[
          Flexible(flex: 1, child: FittedBox(child: Text(burger.name ?? ''))),
          Flexible(
              flex: 6,
              child: Row(children: <Widget>[
                Flexible(
                    flex: 1,
                    child: Column(children: <Widget>[
                      const Spacer(),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              selected = !selected;
                            });
                            widget.onSelect(burger, selected);
                          },
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(2, 0, 4, 0),
                              child: selected
                                  ? _radioButtonSelected
                                  : _radioButton)),
                      const Spacer()
                    ])),
                Flexible(
                    flex: 3,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, BurgerEditPage.routeName,
                              arguments: BurgerEditArguments(burger));
                        },
                        child: ImageWithFallback(
                            icon: burger.icon,
                            fallback:
                                ImageUrlLoader.prefixUrl('/icons/burger.png'),
                            height: 80,
                            width: 80)))
              ])),
          Flexible(
              flex: 1, child: FittedBox(child: Text('${burger.price ?? 0} Kč')))
        ]));
  }
}
