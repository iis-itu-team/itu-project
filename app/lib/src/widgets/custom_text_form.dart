import 'package:flutter/material.dart';
import 'package:food_blueprint/src/theme/theme.dart';

class CustomTextForm extends StatefulWidget implements PreferredSizeWidget {
  String? text;

  final TextEditingController? controller;

  CustomTextForm({super.key, required this.text, required this.controller});

  @override
  State<CustomTextForm> createState() => _CustomTextFormState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomTextFormState extends State<CustomTextForm> {
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
