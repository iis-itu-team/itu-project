///
///  Author: Martin Otradovec
///  Author e-mail: xotrad00@fit.vutbr.cz
///  Date: 16. 12. 2023
///
import 'package:flutter/cupertino.dart';
import 'package:food_blueprint/src/utils/image_loader.dart';
import 'package:food_blueprint/src/widgets/common/image_with_fallback.dart';

class Loading extends StatelessWidget {
  final String? icon;
  final String? text;
  final double? height;
  final double? width;

  const Loading({super.key, this.icon, this.text, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    double realHeight = height ?? 160;
    double realWidth = width ?? 160;

    return SizedBox(
        width: (realWidth),
        height: (realHeight + 40), // some space for text
        child: Column(children: [
          ImageWithFallback(
              icon: icon,
              width: (realWidth),
              height: (realHeight),
              fallback: ImageUrlLoader.prefixUrl('/icons/burger.png')),
          Text(text ?? 'Loading...', textAlign: TextAlign.center)
        ]));
  }
}
