import 'package:flutter/material.dart';

class NameWidget extends StatefulWidget {
  final String? initialName;

  const NameWidget({super.key, this.initialName});

  @override
  State<StatefulWidget> createState() => _TitleState();
}

class _TitleState extends State<NameWidget> {
  String _name = "Nejvíc Burgr";

  @override
  void initState() {
    super.initState();
    _name = widget.initialName ?? "Nejvíc Burgr";
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
          child: TextFormField(
            initialValue: _name,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Burger name'))),
    ]);
  }
}
