import 'package:flutter/material.dart';
import 'package:food_blueprint/src/pages/basic/basic_page.dart';
import 'package:food_blueprint/src/pages/community/community_page.dart';
import 'package:food_blueprint/src/pages/home/home_page.dart';
import 'package:food_blueprint/src/pages/mine/mine_page.dart';
import 'package:food_blueprint/src/widgets/custom_button.dart';

class CustomRowMenu extends StatelessWidget implements PreferredSizeWidget {
  const CustomRowMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButton(text: 'Domov', route: HomePage.routeName),
        CustomButton(text: 'Moje', route: MinePage.routeName),
        CustomButton(text: 'Komunitné', route: CommunityPage.routeName),
        CustomButton(text: 'Základné', route: BasicPage.routeName),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
