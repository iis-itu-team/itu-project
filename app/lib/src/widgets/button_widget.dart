/// Copyright (C) -> see copyright_notice.txt in root dir
///
///  Author: Matúš Hubinský
///  Author e-mail: xhubin04@fit.vutbr.cz
///  Collaborator: Marek Vandík - complete overhaul
///  Collaborator e-mail: xvandi01@fit.vutbr.cz
///  Date: 17. 12. 2023
///
import 'package:flutter/material.dart';

import 'package:food_blueprint/src/theme/theme.dart';

class ButtonWidget extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final String route;
  final bool underline;

  const ButtonWidget(
      {super.key,
      required this.text,
      required this.route,
      required this.underline});

  @override
  Widget build(BuildContext context) {
    TextStyle? style = Theme.of(context).textTheme.titleSmall;
    TextStyle? modifiedStyle = underline
        ? style?.copyWith(
            decoration: TextDecoration.combine([
              style.decoration ?? TextDecoration.none,
              TextDecoration.underline
            ]),
            decorationColor: ThemeColors.colorCheese,
            decorationThickness: 3)
        : style;
    return OutlinedButton(
      onPressed: () {
        Navigator.pushReplacementNamed(context, route);
      },
      style: OutlinedButton.styleFrom(
        side: const BorderSide(
          color: Colors.transparent,
        ),
      ),
      child: Text(text, style: modifiedStyle),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
