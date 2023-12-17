import 'package:flutter/material.dart';
import 'package:food_blueprint/src/theme/theme.dart';
import 'dart:ui';

class ButtonWidget extends StatelessWidget implements PreferredSizeWidget {
  String? text;

  // route to another page
  var route;

  ButtonWidget({
    super.key,
    required this.text,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      style: OutlinedButton.styleFrom(
        side: const BorderSide(
          color: Colors.transparent,
        ),
      ),
      child: Text(
        text!,
        style: const TextStyle(
            color: ThemeColors.colorText,
            fontSize: 12,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
