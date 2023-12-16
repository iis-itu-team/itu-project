import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const double _componentHeight = 100;
const double _componentWidth = 90;

const double _shareButtonHeight = 30;
const double _shareButtonWidth = 30;

final Widget _shareButton = SvgPicture.asset(
  'assets/images/PlusSign.svg',
  height: _shareButtonHeight,
  width: _shareButtonWidth,
);

class ShareWidget extends StatelessWidget {
  const ShareWidget({super.key, required this.onTap});

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: _componentHeight,
        width: _componentWidth,
        constraints: const BoxConstraints(
            maxHeight: _componentHeight, maxWidth: _componentWidth),
        child: Column(children: <Widget>[
          const Flexible(flex: 1, child: Text('Sdielaj svuj')),
          const Flexible(flex: 1, child: Text('burger!')),
          Flexible(
              flex: 2,
              child: FittedBox(
                  fit: BoxFit.none,
                  child: IconButton(onPressed: onTap, icon: _shareButton)))
        ]));
  }
}
