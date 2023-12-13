import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_blueprint/src/models/burger.dart';
import 'package:food_blueprint/src/theme/theme.dart';

import 'package:food_blueprint/src/services/rating_service.dart';

const double _burgerHeight = 50;
const double _burgerWidth = 50;
const double _borderWidth = 4;
const double _borderRadius = 4;
final Image _defaultImage = Image.file(File('assets/images/flutter_logo.png'));

class BurgerRatingWidget extends StatefulWidget {
  const BurgerRatingWidget({super.key, this.burger});

  final Burger? burger;

  @override
  BurgerRatingWidgetState createState() => BurgerRatingWidgetState();
}

class BurgerRatingWidgetState extends State<BurgerRatingWidget> {
  Burger? burger;
  BurgerRating pressed = BurgerRating.none;

  @override
  void initState() {
    super.initState();
    burger = widget.burger;
    pressed = widget.burger?.currentRating ?? BurgerRating.none;
  }

  rate(BurgerRating motion) async {
    if (pressed == motion) {
      pressed = BurgerRating.none;
    } else {
      pressed = motion;
    }

    final response = await RatingService.rateBurger(burger?.id, pressed);
    // TODO check status for error
    setState(() {
      burger = response.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: _burgerHeight,
        width: _burgerWidth,
        decoration: BoxDecoration(
            color: ThemeColors.colorMeat,
            border: Border.all(width: _borderWidth),
            borderRadius: BorderRadius.circular(_borderRadius)),
        child: Column(children: <Widget>[
          Text(burger?.name ?? 'Name'),
          Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Expanded(
                      child: TextButton(
                          onPressed: () async {
                            await rate(BurgerRating.up);
                          },
                          child: const Text('up'))),
                  Expanded(child: Text('${burger?.rating ?? 0}')),
                  Expanded(
                      child: TextButton(
                          onPressed: () async {
                            await rate(BurgerRating.down);
                          },
                          child: const Text('down')))
                ],
              ),
              burger?.image != null
                  ? Image.network('${burger?.image}')
                  : _defaultImage
            ],
          ),
          Text('${burger?.price ?? 0} Kč')
        ]));
  }
}
