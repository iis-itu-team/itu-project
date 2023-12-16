import 'package:flutter/material.dart';
import 'package:food_blueprint/src/theme/theme.dart';

class CheckboxWidget extends StatefulWidget implements PreferredSizeWidget {
  final String text;
  final bool value;

  const CheckboxWidget({super.key, required this.text, required this.value});

  @override
  State<CheckboxWidget> createState() => _CustomCheckboxListTileState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomCheckboxListTileState extends State<CheckboxWidget> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(
        widget.text,
        style: const TextStyle(color: ThemeColors.colorMeat, fontSize: 18),
      ),
      value: isChecked,
      onChanged: (bool? value) {
        value != value;
        setState(() {
          isChecked = value;
        });
      },
      activeColor: ThemeColors.colorBun,
    );
  }

  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
