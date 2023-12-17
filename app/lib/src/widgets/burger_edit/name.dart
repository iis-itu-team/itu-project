/// Copyright (C) -> see copyright_notice.txt in root dir
///
///  Author: Martin Otradovec
///  Author e-mail: xotrad00@fit.vutbr.cz
///  Date: 14. 12. 2023
///
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NameWidget extends StatefulWidget {
  final String? initialName;

  final Function(String value) onSubmit;

  const NameWidget({super.key, required this.onSubmit, this.initialName});

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
              onChanged: (value) {
                _name = value;
              },
              onSaved: (value) {
                widget.onSubmit(_name);
              },
              onTapOutside: (value) {
                widget.onSubmit(_name);
              },
              inputFormatters: [LengthLimitingTextInputFormatter(20)],
              decoration: const InputDecoration(labelText: 'Název'))),
    ]);
  }
}
