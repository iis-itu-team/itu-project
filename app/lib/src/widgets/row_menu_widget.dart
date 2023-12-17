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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ButtonWidget(text: 'Domov', route: HomePage.routeName),
        ButtonWidget(text: 'Moje', route: MinePage.routeName),
        ButtonWidget(text: 'Komunitné', route: CommunityPage.routeName),
        ButtonWidget(text: 'Základné', route: BasicPage.routeName),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
