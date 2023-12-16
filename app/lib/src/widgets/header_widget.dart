import 'package:flutter/material.dart';
import 'package:food_blueprint/src/theme/theme.dart';

class HeaderWidget extends StatelessWidget implements PreferredSizeWidget {
  String? text = '';

  HeaderWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text!,
          style: TextStyle(
              color: ThemeColors.colorMeat,
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Divider(
              thickness: 4.0, color: ThemeColors.colorMeat, indent: 5.0),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}