import 'package:flutter/material.dart';

import 'package:food_blueprint/src/http/result.dart';
import 'package:food_blueprint/src/models/burger.dart';
import 'package:food_blueprint/src/services/burger_service.dart';
import 'package:food_blueprint/src/services/rating_service.dart';
import 'package:food_blueprint/src/theme/theme.dart';

import 'package:food_blueprint/src/widgets/bottom_navigation_widget.dart';
import 'package:food_blueprint/src/widgets/burger_rating_widget.dart';
import 'package:food_blueprint/src/widgets/custom_app_bar.dart';
import 'package:food_blueprint/src/widgets/custom_row_menu.dart';

class CommunityPage extends StatefulWidget {
  static const routeName = '/community';

  const CommunityPage(
      {super.key, required this.burgerService, required this.ratingService});

  final BurgerService burgerService;
  final RatingService ratingService;

  @override
  CommunityPageState createState() => CommunityPageState();
}

class CommunityPageState extends State<CommunityPage> {
  late Future<HttpResult<List<Burger>>> _communityBurgersFuture;

  @override
  void initState() {
    super.initState();
    _communityBurgersFuture = widget.burgerService.listCommunityBurgers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(text: 'Komunitný Workshop'),
        body: LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          return Container(
              constraints: viewportConstraints,
              child: Column(children: <Widget>[
                const CustomRowMenu(),
                const Text('top týždňa',
                    style: TextStyle(color: ThemeColors.colorMeat)),
                FutureBuilder(
                    future: _communityBurgersFuture,
                    builder: (BuildContext context,
                        AsyncSnapshot<HttpResult<List<Burger>>> snapshot) {
                      List<Burger> communityBurgers = [];

                      if (snapshot.hasData) {
                        if (snapshot.data?.statusCode == 200) {
                          communityBurgers = snapshot.data?.data ?? [];
                          return BurgerRatingWidget(
                              burger: communityBurgers[0],
                              ratingService: widget.ratingService);
                        } else {
                          return Text(
                              'Niečo sa nepovedlo - ${snapshot.data?.status}',
                              style: const TextStyle(
                                  color: ThemeColors.colorKetchup));
                        }
                      } else {
                        return const Text('Čakám na dáta',
                            style: TextStyle(color: ThemeColors.colorMeat));
                      }
                    })
              ]));
        }),
        bottomNavigationBar: const BottomNavigationWidget());
  }
}
