/// Copyright (C) -> see copyright_notice.txt in root dir
///
///  Author: Matúš Hubinský
///  Author e-mail: xhubin04@fit.vutbr.cz
///  Collaborator: Marek Vandík - complete overhaul
///  Collaborator e-mail: xvandi01@fit.vutbr.cz
///  Date: 17. 12. 2023
///
import 'package:flutter/material.dart';
import 'package:food_blueprint/src/pages/basic/basic_page.dart';
import 'package:food_blueprint/src/pages/community/community_page.dart';
import 'package:food_blueprint/src/pages/home/home_page.dart';
import 'package:food_blueprint/src/pages/mine/mine_page.dart';
import 'package:food_blueprint/src/widgets/button_widget.dart';

class RowMenuWidget extends StatelessWidget implements PreferredSizeWidget {
  const RowMenuWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String currentRoute =
        ModalRoute.of(context)?.settings.name ?? HomePage.routeName;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
            child: FittedBox(
                child: ButtonWidget(
                    text: 'Domov',
                    route: HomePage.routeName,
                    underline: currentRoute == HomePage.routeName))),
        Flexible(
            child: FittedBox(
                child: ButtonWidget(
                    text: 'Moje',
                    route: MinePage.routeName,
                    underline: currentRoute == MinePage.routeName))),
        Flexible(
            child: FittedBox(
                child: ButtonWidget(
                    text: 'Komunitní',
                    route: CommunityPage.routeName,
                    underline: currentRoute == CommunityPage.routeName))),
        Flexible(
            child: FittedBox(
                child: ButtonWidget(
                    text: 'Základní',
                    route: BasicPage.routeName,
                    underline: currentRoute == BasicPage.routeName))),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
