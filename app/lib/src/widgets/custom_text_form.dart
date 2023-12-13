import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget implements PreferredSizeWidget {
  String? variable;

  CustomTextForm({super.key, 
    required this.variable,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: (String? value) {
        variable = value;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
