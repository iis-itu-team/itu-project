///
///  Author: Marek Vandík
///  Author e-mail: xvandi01@fit.vutbr.cz
///  Date: 16. 12. 2023
///
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:food_blueprint/src/theme/theme.dart';

const double _borderWidth = 2.0;
const double _borderRadius = 5.0;

const double _magnifyingGlassSize = 23;
const double _barHeight = 26;

final Widget _magnifyingGlass = SvgPicture.asset(
    'assets/images/MagnigyingGlass.svg',
    height: _magnifyingGlassSize,
    width: _magnifyingGlassSize);

class RatingSearchBarWidget extends StatelessWidget {
  const RatingSearchBarWidget({super.key, required this.onInputChanged});

  final Function(String value) onInputChanged;

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      const SizedBox(width: 5),
      _magnifyingGlass,
      const SizedBox(width: 8),
      Expanded(
          child: Container(
              height: _barHeight,
              decoration: BoxDecoration(
                  border: Border.all(
                      width: _borderWidth, color: ThemeColors.colorCheese),
                  borderRadius: BorderRadius.circular(_borderRadius)),
              child: TextFormField(
                initialValue: '',
                onChanged: (val) {
                  onInputChanged(val);
                },
              ))),
      const SizedBox(width: 5)
    ]);
  }
}
