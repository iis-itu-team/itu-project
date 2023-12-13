import 'package:flutter/material.dart';
import 'package:food_blueprint/src/theme/theme.dart';

class CustomCheckboxListTile extends StatelessWidget
    implements PreferredSizeWidget {
  final String text;
  final bool value;

  const CustomCheckboxListTile(
      {super.key, required this.text, required this.value});

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: false,
      onChanged: (bool? value) {
        value != value;
      },
      title: Text(
        text,
        style: const TextStyle(color: COLOR_TEXT, fontSize: 18),
      ),
      activeColor: COLOR_SECONDARY,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
