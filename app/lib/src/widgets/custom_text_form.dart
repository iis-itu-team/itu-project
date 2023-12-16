import 'package:flutter/material.dart';
import 'package:food_blueprint/src/theme/theme.dart';

class CustomTextForm extends StatelessWidget implements PreferredSizeWidget {
  String? variable;

  CustomTextForm({
    super.key,
    required this.variable,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: (String? value) {
        variable = value;
      },
      decoration: InputDecoration(
        focusColor: ThemeColors.colorBun,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: ThemeColors.colorBun,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
