import 'package:flutter/material.dart';
import 'package:food_blueprint/src/theme/theme.dart';

class CustomCheckboxListTile extends StatelessWidget
    implements PreferredSizeWidget {
  final String text;

  const CustomCheckboxListTile({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: false,
      onChanged: (val) {},
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
