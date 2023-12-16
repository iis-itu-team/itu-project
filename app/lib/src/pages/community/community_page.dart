import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:async';

import 'package:food_blueprint/src/http/result.dart';
import 'package:food_blueprint/src/models/burger.dart';
import 'package:food_blueprint/src/services/burger_service.dart';
import 'package:food_blueprint/src/services/rating_service.dart';
import 'package:food_blueprint/src/theme/theme.dart';

import 'package:food_blueprint/src/widgets/bottom_navigation_widget.dart';
import 'package:food_blueprint/src/widgets/burger_rating_widget.dart';
import 'package:food_blueprint/src/widgets/burger_select_floating_page.dart';
import 'package:food_blueprint/src/widgets/button_share.dart';
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
  Timer? _searchTimeoutTimer;
  String _search = '';
  List<Widget> _stack = [];

  late Future<HttpResult<List<Burger>>> _searchBurgersFuture;
  late Future<HttpResult<List<Burger>>> _topBurgersFuture;

  @override
  void initState() {
    super.initState();
    _searchBurgersFuture = widget.burgerService.listCommunityBurgers();
    _topBurgersFuture = widget.burgerService.listBestCommunityBurgers();
  }

  void fetchSearchQuery() {
    setState(() {
      _searchBurgersFuture =
          widget.burgerService.listCommunityBurgers(searchQuery: _search);
    });
  }

  void fetchData() {
    setState(() {
      _searchBurgersFuture =
          widget.burgerService.listCommunityBurgers(searchQuery: _search);
      _topBurgersFuture = widget.burgerService.listBestCommunityBurgers();
    });
  }

  void searchChanged(String newSearch) {
    _search = newSearch;
    _searchTimeoutTimer?.cancel();
    _searchTimeoutTimer =
        Timer(const Duration(milliseconds: 1500), fetchSearchQuery);
  }

  void openSelectPage() {
    setState(() {
      _stack = [
        Container(color: const Color.fromRGBO(0, 0, 0, 0.25)),
        BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
            child: Container(color: Colors.transparent)),
        BurgerSelectFloatingPage(
            burgerService: widget.burgerService, onClose: onSelectClose)
      ];
    });
  }

  void closeSelectPage() {
    setState(() {
      _stack = [];
    });
  }

  // Close selection page
  void onSelectClose() {
    fetchData();
    closeSelectPage();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: <Widget>[
      Scaffold(
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
                future: _topBurgersFuture,
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
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            5, 0, 0, 0),
                                        child: BurgerRatingWidget(
                                            burger: communityBurgers[index],
                                            ratingService:
                                                widget.ratingService));
                                  }))
                          : const Text('Ve workshope nejsou žiadné burgre');
                    } else {
                      return Text(
                          'Niečo sa nepovedlo - ${snapshot.data?.status}',
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
            const SizedBox(height: 8),
            RatingSearchBarWidget(onInputChanged: searchChanged),
            const SizedBox(height: 5),
            Expanded(
                child: FutureBuilder(
                    future: _searchBurgersFuture,
                    builder: (BuildContext context,
                        AsyncSnapshot<HttpResult<List<Burger>>> snapshot) {
                      List<Burger> communityBurgers = [];
                      List<List<Widget>> rowContents = [];

                      if (snapshot.hasData) {
                        if (snapshot.data?.statusCode == 200) {
                          communityBurgers = snapshot.data?.data ?? [];
                          int rowCnt = 0;
                          List<Widget> activeRow = [];
                          if (_search == '') {
                            activeRow = [
                              SizedBox(
                                  height: BurgerRatingWidget.height,
                                  width: BurgerRatingWidget.width,
                                  child: ShareWidget(onTap: openSelectPage))
                            ];
                            rowCnt++;
                          }
                          rowContents.add(activeRow);
                          for (int i = 0; i < communityBurgers.length; i++) {
                            if (rowCnt % 3 == 0) {
                              rowCnt = 0;
                              activeRow = [];
                              rowContents.add(activeRow);
                            }

                            activeRow.add(BurgerRatingWidget(
                                burger: communityBurgers[i],
                                ratingService: widget.ratingService));
                            rowCnt++;
                          }

                          return ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: rowContents.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: rowContents[index]));
                              });
                        } else {
                          return Text(
                              'Niečo sa nepovedlo - ${snapshot.data?.status}',
                              style: const TextStyle(
                                  color: ThemeColors.colorKetchup));
                        }
                      } else {
                        return const Text('Čakám na dáta');
                      }
                    }))
          ]),
          bottomNavigationBar: const BottomNavigationWidget()),
      ..._stack
    ]);
  }
}
