///
///  Author: Matúš Hubinský
///  Author e-mail: xhubin04@fit.vutbr.cz
///  Date: 17. 12. 2023
///
import 'package:flutter/material.dart';
import 'package:food_blueprint/src/theme/theme.dart';

class TextFormWidget extends StatefulWidget implements PreferredSizeWidget {
  String? text;

  final TextEditingController? controller;

  TextFormWidget({super.key, required this.text, required this.controller});

  @override
  State<TextFormWidget> createState() => _CustomTextFormState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomTextFormState extends State<TextFormWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.text,
      style: const TextStyle(
        fontSize: 18,
        color: ThemeColors.colorMeat,
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        labelText: widget.text,
        fillColor: ThemeColors.colorBunLight,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
            color: ThemeColors.colorMeat,
            width: 10.0,
          ),
        ),
      ),
    );
  }

  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
