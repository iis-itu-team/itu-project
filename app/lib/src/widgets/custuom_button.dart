import 'package:flutter/material.dart';
import 'package:food_blueprint/src/theme/theme.dart';

class CustomButton extends StatelessWidget implements PreferredSizeWidget {
  String? text;

  var route;

  CustomButton({
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
            color: COLOR_TEXT, fontSize: 14, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
