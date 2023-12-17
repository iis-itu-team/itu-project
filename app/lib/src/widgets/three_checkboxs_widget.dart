///
///  Author: Matúš Hubinský
///  Author e-mail: xhubin04@fit.vutbr.cz
///  Date: 16. 12. 2023
///
import 'package:flutter/material.dart';
import 'package:food_blueprint/src/theme/theme.dart';

class ThreeCheckboxsWidget extends StatefulWidget
    implements PreferredSizeWidget {
  final String text1;
  final String text2;
  final String text3;
  final Function callbackFunction;

  const ThreeCheckboxsWidget({
    super.key,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.callbackFunction,
  });

  @override
  State<ThreeCheckboxsWidget> createState() => _CustomCheckboxListTileState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomCheckboxListTileState extends State<ThreeCheckboxsWidget> {
  bool value1 = false;
  bool value2 = false;
  bool value3 = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckboxListTile(
          title: Text(
            widget.text1,
            style: const TextStyle(
              color: ThemeColors.colorMeat,
              fontSize: 18,
            ),
          ),
          value: value1,
          onChanged: (bool? value) {
            setState(
              () {
                value1 = value!;
                value2 = false;
                value3 = false;
                widget.callbackFunction(widget.text1);
              },
            );
          },
          activeColor: ThemeColors.colorBun,
        ),
        CheckboxListTile(
          title: Text(
            widget.text2,
            style: const TextStyle(
              color: ThemeColors.colorMeat,
              fontSize: 18,
            ),
          ),
          value: value2,
          onChanged: (bool? value) {
            setState(
              () {
                value2 = value!;
                value1 = false;
                value3 = false;
                widget.callbackFunction(widget.text2);
              },
            );
          },
          activeColor: ThemeColors.colorBun,
        ),
        CheckboxListTile(
          title: Text(
            widget.text3,
            style: const TextStyle(
              color: ThemeColors.colorMeat,
              fontSize: 18,
            ),
          ),
          value: value3,
          onChanged: (bool? value) {
            setState(
              () {
                value3 = value!;
                value1 = false;
                value2 = false;
                widget.callbackFunction(widget.text3);
              },
            );
          },
          activeColor: ThemeColors.colorBun,
        )
      ],
    );
  }

  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
