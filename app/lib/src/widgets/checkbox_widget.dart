/// Copyright (C) -> see copyright_notice.txt in root dir
///
///  Author: Matúš Hubinský
///  Author e-mail: xhubin04@fit.vutbr.cz
///  Date: 17. 12. 2023
///
import 'package:flutter/material.dart';
import 'package:food_blueprint/src/theme/theme.dart';

class CheckBoxWidget extends StatefulWidget implements PreferredSizeWidget {
  final String text;
  final bool value;

  const CheckBoxWidget({super.key, required this.text, required this.value});

  @override
  State<CheckBoxWidget> createState() => _CustomCheckboxListTileState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomCheckboxListTileState extends State<CheckBoxWidget> {
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
