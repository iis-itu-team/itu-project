import 'package:flutter/material.dart';

// TODO: add check box title

class Checkbox extends StatefulWidget {
  const Checkbox(
      {super.key,
      required Color checkColor,
      required MaterialStateProperty<Color> fillColor,
      required bool value,
      required Null Function(bool? value) onChanged});

  @override
  State<Checkbox> createState() => _Checkbox();
}

class _Checkbox extends State<Checkbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
