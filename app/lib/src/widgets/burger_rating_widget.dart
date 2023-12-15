import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter/material.dart';
import 'package:food_blueprint/src/models/burger.dart';
import 'package:food_blueprint/src/theme/theme.dart';

import 'package:food_blueprint/src/services/rating_service.dart';

const double _burgerHeight = 100;
const double _burgerWidth = 90;
const double _borderWidth = 2;
const double _borderRadius = 3;

const Image _defaultImage =
    Image(image: AssetImage('assets/images/flutter_logo.png'));

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

class BurgerRatingWidgetState extends State<BurgerRatingWidget> {
  Burger? burger;
  BurgerRating pressed = BurgerRating.none;

  @override
  void initState() {
    super.initState();
    burger = widget.burger;
    pressed = widget.burger.currentRating ?? BurgerRating.none;
  }

  rate(BurgerRating motion) async {
    if (pressed == motion) {
      pressed = BurgerRating.none;
    } else {
      pressed = motion;
    }

    final response = await widget.ratingService.rateBurger(burger?.id, pressed);
    // TODO check status for error
    setState(() {
      burger = response.data;
    });
  }

  // If you want to change layout aspect, change flex value in Flexible
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
          Flexible(flex: 1, child: FittedBox(child: Text(burger?.name ?? ''))),
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
                              FittedBox(child: Text('${burger?.rating ?? 0}'))),
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
                    child: burger?.image != null
                        ? Image.network('${burger?.image}', loadingBuilder:
                            (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                            return CircularProgressIndicator(
                                value:
                                    (loadingProgress?.cumulativeBytesLoaded ??
                                            0) /
                                        (loadingProgress?.expectedTotalBytes ??
                                            100000000));
                          })
                        : _defaultImage)
              ])),
          Flexible(
              flex: 1,
              child: FittedBox(child: Text('${burger?.price ?? 0} Kč')))
        ]));
  }
}
