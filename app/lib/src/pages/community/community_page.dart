/// Copyright (C) -> see copyright_notice.txt in root dir
///
///  Author: Marek Vandík
///  Author e-mail: xvandi01@fit.vutbr.cz
///  Date: 14. 12. 2023
///
import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:food_blueprint/src/http/result.dart';
import 'package:food_blueprint/src/models/burger.dart';
import 'package:food_blueprint/src/services/burger_service.dart';
import 'package:food_blueprint/src/services/rating_service.dart';
import 'package:food_blueprint/src/theme/theme.dart';
import 'package:food_blueprint/src/types/cart.dart';
import 'package:food_blueprint/src/widgets/app_bar_widget.dart';
import 'package:food_blueprint/src/widgets/bottom_navigation_widget.dart';
import 'package:food_blueprint/src/widgets/burger_rating_widget.dart';
import 'package:food_blueprint/src/widgets/burger_select_floating_page.dart';
import 'package:food_blueprint/src/widgets/button_share.dart';
import 'package:food_blueprint/src/widgets/cart/cart_drop_provider.dart';
import 'package:food_blueprint/src/widgets/cart/order_button.dart';
import 'package:food_blueprint/src/widgets/common/image_with_fallback.dart';
import 'package:food_blueprint/src/widgets/rating_searchbar.dart';
import 'package:food_blueprint/src/widgets/row_menu_widget.dart';
import 'package:food_blueprint/src/utils/image_loader.dart';

class CommunityPage extends StatefulWidget {
  static const routeName = '/community';

  final Cart cart;

  const CommunityPage(
      {super.key,
      required this.burgerService,
      required this.ratingService,
      required this.cart});

  final BurgerService burgerService;
  final RatingService ratingService;

  @override
  CommunityPageState createState() => CommunityPageState();
}

class CommunityPageState extends State<CommunityPage> {
  Timer? _searchTimeoutTimer;
  String _search = '';
  List<Widget> _stack = [];

  final LayerLink _layerLink = LayerLink();

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

  // Callback for when search query changes - 1.5s timeout before sending request
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

  // Callback for when floating select share page closes
  void onSelectClose() {
    fetchData();
    closeSelectPage();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: <Widget>[
      Scaffold(
        appBar: const AppBarWidget(text: 'Komunitní Workshop'),
        body: CartDropProvider(
            layerLink: _layerLink,
            child: Column(children: <Widget>[
              const RowMenuWidget(),
              const Padding(
                  padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  child: Row(children: <Widget>[
                    Text('top týdne'),
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
                                          child: LongPressDraggable(
                                              delay: const Duration(
                                                  milliseconds: 150),
                                              data: communityBurgers[index],
                                              dragAnchorStrategy:
                                                  (object, context, offset) {
                                                return const Offset(40, 40);
                                              },
                                              feedback: ImageWithFallback(
                                                  icon: communityBurgers[index]
                                                      .icon,
                                                  width: 80,
                                                  height: 80,
                                                  fallback:
                                                      ImageUrlLoader.prefixUrl(
                                                          '/icons/burger.png')),
                                              child: BurgerRatingWidget(
                                                  burger:
                                                      communityBurgers[index],
                                                  ratingService:
                                                      widget.ratingService)));
                                    }))
                            : const Text('Ve workshopu nejsou žádné burgery');
                      } else {
                        return Text(
                            'Něco se nepovedlo - ${snapshot.data?.status}',
                            style: const TextStyle(
                                color: ThemeColors.colorKetchup));
                      }
                    } else {
                      return const Text('Čekám na data');
                    }
                  }),
              const SizedBox(height: 20),
              const Padding(
                  padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  child: Row(children: <Widget>[
                    Text('vyhledávání'),
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

                              activeRow.add(LongPressDraggable(
                                  delay: const Duration(milliseconds: 150),
                                  data: communityBurgers[i],
                                  dragAnchorStrategy:
                                      (object, context, offset) {
                                    return const Offset(40, 40);
                                  },
                                  feedback: ImageWithFallback(
                                      icon: communityBurgers[i].icon,
                                      width: 80,
                                      height: 80,
                                      fallback: ImageUrlLoader.prefixUrl(
                                          '/icons/burger.png')),
                                  child: BurgerRatingWidget(
                                      burger: communityBurgers[i],
                                      ratingService: widget.ratingService)));
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
                                'Něco se nepovedlo - ${snapshot.data?.status}',
                                style: const TextStyle(
                                    color: ThemeColors.colorKetchup));
                          }
                        } else {
                          return const Text('Čekám na data');
                        }
                      }))
            ])),
        bottomNavigationBar: BottomNavigationWidget(cart: widget.cart),
        floatingActionButton: const OrderButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      ),
      ..._stack
    ]);
  }
}
