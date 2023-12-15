import 'package:flutter/material.dart';
import 'package:food_blueprint/src/theme/theme.dart';

class CustomOrderText extends StatelessWidget implements PreferredSizeWidget {
  String? input;

  CustomOrderText({
    super.key,
    required this.input,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 100,
        child: Text(
          "$input",
          style: const TextStyle(
            color: ThemeColors.colorText,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
