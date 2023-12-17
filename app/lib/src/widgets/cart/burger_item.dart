/// Copyright (C) -> see copyright_notice.txt in root dir
///
///  Author: Martin Otradovec
///  Author e-mail: xotrad00@fit.vutbr.cz
///  Date: 17. 12. 2023
///
import 'package:flutter/cupertino.dart';
import 'package:food_blueprint/src/models/burger.dart';
import 'package:food_blueprint/src/utils/image_loader.dart';
import 'package:food_blueprint/src/widgets/common/image_with_fallback.dart';

class BurgerItem extends StatelessWidget {
  final Burger burger;

  const BurgerItem({super.key, required this.burger});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 100,
        height: 120,
        child: Column(children: [
          Text(burger.name ?? '',
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w800)),
          Expanded(
              child: ImageWithFallback(
                  key: ValueKey(burger.hashCode),
                  icon: burger.icon,
                  width: 80,
                  height: 80,
                  fallback: ImageUrlLoader.prefixUrl('/icons/burger.png'))),
          Text('${burger.price} Kč', textAlign: TextAlign.end)
        ]));
  }
}
