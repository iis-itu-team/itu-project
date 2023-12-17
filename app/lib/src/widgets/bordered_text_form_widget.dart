/// Copyright (C) -> see copyright_notice.txt in root dir
///
///  Author: Matúš Hubinský
///  Author e-mail: xhubin04@fit.vutbr.cz
///  Date: 16. 12. 2023
///
import 'package:flutter/material.dart';
import 'package:food_blueprint/src/theme/theme.dart';

class BorderedTextFormField extends StatelessWidget {
  final Widget child;

  const BorderedTextFormField({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: ThemeColors.colorMeat, // Set the border color
          width: 1.0, // Set the border width
        ),
        borderRadius: const BorderRadius.all(
            Radius.circular(8.0)), // Set the border radius
      ),
      child: child,
    );
  }
}
