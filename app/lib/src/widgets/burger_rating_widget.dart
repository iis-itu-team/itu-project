///
///  Author: Marek Vandík
///  Author e-mail: xvandi01@fit.vutbr.cz
///  Date: 13. 12. 2023
///
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:food_blueprint/src/interfaces/irating_changed.dart';
import 'package:food_blueprint/src/models/burger.dart';
import 'package:food_blueprint/src/pages/burger_edit/burger_edit_page.dart';
import 'package:food_blueprint/src/pages/burger_edit/burger_edit_arguments.dart';
import 'package:food_blueprint/src/services/rating_service.dart';
import 'package:food_blueprint/src/theme/theme.dart';
import 'package:food_blueprint/src/utils/image_loader.dart';
import 'package:food_blueprint/src/widgets/common/image_with_fallback.dart';

const double _burgerHeight = 100;
const double _burgerWidth = 90;
const double _borderWidth = 2;
const double _borderRadius = 3;

const double _voteButtonHeight = 10;
const double _voteButtonWidth = 10;

final Widget _buttonUp = SvgPicture.asset(
  'assets/images/UpVote.svg',
  height: _voteButtonHeight,
  width: _voteButtonWidth,
);
final Widget _buttonUpSelected = SvgPicture.asset(
  'assets/images/UpVoteSelected.svg',
  height: _voteButtonHeight,
  width: _voteButtonWidth,
);
final Widget _buttonDown = SvgPicture.asset(
  'assets/images/DownVote.svg',
  height: _voteButtonHeight,
  width: _voteButtonWidth,
);
final Widget _buttonDownSelected = SvgPicture.asset(
  'assets/images/DownVoteSelected.svg',
  height: _voteButtonHeight,
  width: _voteButtonWidth,
);

class BurgerRatingWidget extends StatefulWidget {
  const BurgerRatingWidget(
      {super.key, required this.burger, required this.ratingService});

  final Burger burger;
  final RatingService ratingService;

  static const height = _burgerHeight;
  static const width = _burgerWidth;

  @override
  BurgerRatingWidgetState createState() => BurgerRatingWidgetState();
}

class BurgerRatingWidgetState extends State<BurgerRatingWidget>
    implements IRatingChanged {
  late Burger burger;
  BurgerRating pressed = BurgerRating.none;

  // Gets called when rating changes for some burgers
  @override
  void onRatingChanged(
      String burgerId, BurgerRating currentDirection, int totalRating) async {
    if (burgerId == burger.id) {
      setState(() {
        pressed = currentDirection;
        burger.rating = totalRating;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    burger = widget.burger;
    pressed = widget.burger.currentRating ?? BurgerRating.none;
    widget.ratingService.registerListener(this);
  }

  @override
  void dispose() {
    widget.ratingService.unregisterListener(this);
    super.dispose();
  }

  Future<void> rate(BurgerRating motion) async {
    if (pressed == motion) {
      pressed = BurgerRating.none;
    } else {
      pressed = motion;
    }

    await rateBurger();
  }

  Future<void> rateBurger() async {
    final response = await widget.ratingService.rateBurger(burger.id, pressed);
    // TODO check status for error
    setState(() {
      burger = response.data ?? burger;
    });
  }

  // If you want to change layout aspect, change flex value in Flexibles
  @override
  Widget build(BuildContext context) {
    return Container(
        height: _burgerHeight,
        width: _burgerWidth,
        constraints: const BoxConstraints(
            maxHeight: _burgerHeight, maxWidth: _burgerWidth),
        decoration: BoxDecoration(
            color: ThemeColors.colorOnion,
            border:
                Border.all(width: _borderWidth, color: ThemeColors.colorMeat),
            borderRadius: BorderRadius.circular(_borderRadius)),
        child: Column(children: <Widget>[
          Flexible(flex: 1, child: FittedBox(child: Text(burger.name ?? ''))),
          Flexible(
              flex: 6,
              child: Row(children: <Widget>[
                Flexible(
                    flex: 1,
                    child: Column(children: <Widget>[
                      const Spacer(flex: 1),
                      Flexible(
                          flex: 3,
                          child: FittedBox(
                              fit: BoxFit.none,
                              child: IconButton(
                                  icon: pressed != BurgerRating.up
                                      ? _buttonUp
                                      : _buttonUpSelected,
                                  onPressed: () async {
                                    await rate(BurgerRating.up);
                                  }))),
                      Flexible(
                          flex: 2,
                          child:
                              FittedBox(child: Text('${burger.rating ?? 0}'))),
                      Flexible(
                          flex: 3,
                          child: FittedBox(
                              fit: BoxFit.none,
                              child: IconButton(
                                  icon: pressed != BurgerRating.down
                                      ? _buttonDown
                                      : _buttonDownSelected,
                                  onPressed: () async {
                                    await rate(BurgerRating.down);
                                  }))),
                      const Spacer(flex: 1)
                    ])),
                Flexible(
                    flex: 3,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, BurgerEditPage.routeName,
                              arguments: BurgerEditArguments(burger));
                        },
                        child: ImageWithFallback(
                            icon: burger.icon,
                            fallback:
                                ImageUrlLoader.prefixUrl('/icons/burger.png'),
                            height: 80,
                            width: 80)))
              ])),
          Flexible(
              flex: 1, child: FittedBox(child: Text('${burger.price ?? 0} Kč')))
        ]));
  }
}
