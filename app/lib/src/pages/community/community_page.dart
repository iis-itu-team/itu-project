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
import 'package:food_blueprint/src/widgets/rating_searchbar.dart';

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
  String _search = '';
  late Future<HttpResult<List<Burger>>> _communityBurgersFuture;

  @override
  void initState() {
    super.initState();
    _communityBurgersFuture = widget.burgerService.listCommunityBurgers();
  }

  void searchChanged(String newSearch) {
    _search = newSearch;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(text: 'Komunitný Workshop'),
        body: Column(children: <Widget>[
          const CustomRowMenu(),
          const Padding(
              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: Row(children: <Widget>[
                Text('top týždňa'),
                Expanded(
                    child: Divider(
                        thickness: 4.0,
                        color: ThemeColors.colorMeat,
                        indent: 5.0))
              ])),
          const SizedBox(height: 5),
          FutureBuilder(
              future: _communityBurgersFuture,
              builder: (BuildContext context,
                  AsyncSnapshot<HttpResult<List<Burger>>> snapshot) {
                List<Burger> communityBurgers = [];

                if (snapshot.hasData) {
                  if (snapshot.data?.statusCode == 200) {
                    communityBurgers = snapshot.data?.data ?? [];
                    return communityBurgers.isNotEmpty
                        ? SizedBox(
                            height: BurgerRatingWidget.height,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: communityBurgers.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      child: BurgerRatingWidget(
                                          burger: communityBurgers[index],
                                          ratingService: widget.ratingService));
                                }))
                        : const Text('Ve workshope nejsou žiadné burgre');
                  } else {
                    return Text('Niečo sa nepovedlo - ${snapshot.data?.status}',
                        style:
                            const TextStyle(color: ThemeColors.colorKetchup));
                  }
                } else {
                  return const Text('Čakám na dáta');
                }
              }),
          const SizedBox(height: 20),
          const Padding(
              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: Row(children: <Widget>[
                Text('vyhledávanie'),
                Expanded(
                    child: Divider(
                        thickness: 4.0,
                        color: ThemeColors.colorMeat,
                        indent: 5.0))
              ])),
          const SizedBox(height: 5),
          RatingSearchBarWidget(onInputChanged: searchChanged)
        ]),
        bottomNavigationBar: const BottomNavigationWidget());
  }
}
