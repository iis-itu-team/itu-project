import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:food_blueprint/src/http/result.dart';
import 'package:food_blueprint/src/models/burger.dart';
import 'package:food_blueprint/src/services/burger_service.dart';
import 'package:food_blueprint/src/theme/theme.dart';
import 'package:food_blueprint/src/utils/keeper_store.dart';
import 'package:food_blueprint/src/widgets/burger_select_widget.dart';

const double _pageHeight = 610;
const double _pageWidth = 314;
const double _pageBorderRadius = 24;

const double _dividerThickness = 4;

const double _buttonSize = 106;
final Widget _uploadButton = SvgPicture.asset(
    'assets/images/UploadSelecion.svg',
    height: _buttonSize,
    width: _buttonSize);

const double _crossSize = 20;
final Widget _crossButton = SvgPicture.asset('assets/images/Cross.svg',
    height: _crossSize, width: _crossSize);

class BurgerSelectFloatingPage extends StatefulWidget {
  static const routeName = '/community';

  const BurgerSelectFloatingPage(
      {super.key, required this.burgerService, required this.onClose});

  final BurgerService burgerService;

  final Function() onClose;

  @override
  BurgerSelectFloatingPageState createState() =>
      BurgerSelectFloatingPageState();
}

class BurgerSelectFloatingPageState extends State<BurgerSelectFloatingPage> {
  Future<String?> _keeperFuture = KeeperStore.getKeeperId();
  late Future<HttpResult<List<Burger>>> _myBurgersFuture;
  Future<HttpResult<void>>? _submitFuture;

  String? _keeperId;
  List<Burger> _selectedBurgers = [];

  void onSelect(Burger burger, bool insert) {
    if (insert) {
      if (!_selectedBurgers.contains(burger)) {
        setState(() {
          _selectedBurgers.add(burger);
        });
      }
    } else {
      if (_selectedBurgers.contains(burger)) {
        setState(() {
          _selectedBurgers.remove(burger);
        });
      }
    }
  }

  void submit() {
    setState(() {
      _submitFuture = widget.burgerService.publishBurgers(_selectedBurgers);
      _selectedBurgers = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: _pageHeight,
        width: _pageWidth,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_pageBorderRadius),
            color: ThemeColors.colorOnion),
        child: Scaffold(
            body: Stack(alignment: Alignment.bottomCenter, children: <Widget>[
          Column(children: <Widget>[
            Flexible(
                flex: 1,
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: Row(children: <Widget>[
                      const FittedBox(child: Text('moje burgery')),
                      const Expanded(
                          child: Divider(
                              thickness: _dividerThickness,
                              indent: 5,
                              endIndent: 5,
                              color: ThemeColors.colorMeat)),
                      _submitFuture == null
                          ? GestureDetector(
                              onTap: widget.onClose, child: _crossButton)
                          : FutureBuilder(
                              future: _submitFuture,
                              builder: (BuildContext context,
                                  AsyncSnapshot<HttpResult<void>> snapshot) {
                                if (snapshot.hasData) {
                                  return GestureDetector(
                                      onTap: widget.onClose,
                                      child: _crossButton);
                                } else {
                                  return Container();
                                }
                              })
                    ]))),
            Flexible(
                flex: 15,
                child: _submitFuture != null
                    ? FutureBuilder(
                        future: _submitFuture,
                        builder: (BuildContext context,
                            AsyncSnapshot<HttpResult<void>> snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data?.statusCode == 200) {
                              return const Text('Dáta sa úspešne odoslali');
                            } else {
                              return Text(
                                  'Pri odosielaní sa stala chyba: ${snapshot.data?.status}');
                            }
                          } else {
                            return const Text('Odosielam dáta');
                          }
                        })
                    : FutureBuilder(
                        future: _keeperFuture,
                        builder: (BuildContext context,
                            AsyncSnapshot<String?> snapshot) {
                          if (snapshot.hasData) {
                            _keeperId = snapshot.data;
                            _myBurgersFuture = widget.burgerService.listBurgers(
                                GetBurgersInput.from(_keeperId, false));
                            return FutureBuilder(
                                future: _myBurgersFuture,
                                builder: (BuildContext context,
                                    AsyncSnapshot<HttpResult<List<Burger>>>
                                        snapshot) {
                                  if (snapshot.hasData) {
                                    if (snapshot.data?.statusCode == 200) {
                                      List<Burger> myBurgers =
                                          snapshot.data?.data ?? [];
                                      List<List<Widget>> rowContents = [];
                                      List<Widget> activeRow = [];
                                      for (int i = 0;
                                          i < myBurgers.length;
                                          i++) {
                                        if (i % 2 == 0) {
                                          activeRow = [];
                                          rowContents.add(activeRow);
                                        }

                                        activeRow.add(Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(5, 0, 5, 0),
                                            child: BurgerSelectWidget(
                                                burger: myBurgers[i],
                                                onSelect: onSelect)));
                                      }
                                      return rowContents.isNotEmpty
                                          ? ListView.builder(
                                              scrollDirection: Axis.vertical,
                                              itemCount: rowContents.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(5, 5, 5, 5),
                                                    child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: rowContents[
                                                            index]));
                                              })
                                          : const Text(
                                              'Zatial nemáte vlastné burgre');
                                    } else {
                                      return Text(
                                          'Niečo sa nepovedlo - ${snapshot.data?.status}',
                                          style: const TextStyle(
                                              color: ThemeColors.colorKetchup));
                                    }
                                  } else {
                                    return const Text('Čakám na dáta');
                                  }
                                });
                          } else {
                            return const Text('Čakám na keeperId');
                          }
                        }))
          ]),
          IgnorePointer(
              ignoring: true,
              child: Container(height: 80, color: ThemeColors.colorCheese)),
          IgnorePointer(
              ignoring: true,
              child: Container(height: 78, color: ThemeColors.colorBun)),
          _selectedBurgers.isNotEmpty
              ? Positioned(
                  bottom: 10,
                  right: 8,
                  child: GestureDetector(onTap: submit, child: _uploadButton))
              : Container()
        ])));
  }
}
