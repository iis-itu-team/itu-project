import 'package:flutter/material.dart';
import 'package:food_blueprint/src/theme/theme.dart';

class CustomCheckboxListTile extends StatefulWidget
    implements PreferredSizeWidget {
  final String text;
  final bool value;

  const CustomCheckboxListTile(
      {super.key, required this.text, required this.value});

  @override
  State<CustomCheckboxListTile> createState() => _CustomCheckboxListTileState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomCheckboxListTileState extends State<CustomCheckboxListTile> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(
        widget.text,
        style: const TextStyle(color: ThemeColors.colorMeat, fontSize: 25),
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


//       colorr: ThemeColors.colorBun,