/// Copyright (C) -> see copyright_notice.txt in root dir
///
///  Author: Matúš Hubinský
///  Author e-mail: xhubin04@fit.vutbr.cz
///  Date: 17. 12. 2023
///
import 'package:flutter/material.dart';
import 'package:food_blueprint/src/pages/order_show/order_show_page.dart';
import 'package:food_blueprint/src/pages/settings/settings_page.dart';
import 'package:food_blueprint/src/theme/theme.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String text;

  const AppBarWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        text,
        style: const TextStyle(color: ThemeColors.colorText, fontSize: 24),
      ),
      backgroundColor: ThemeColors.colorBun,
      actions: [
        PopupMenuButton<String>(
          onSelected: (value) {
            // Handle menu item selection
            if (value == 'moje objednávky') {
              Navigator.pushNamed(context, OrderShowPage.routeName);
            } else if (value == 'nastavenia') {
              Navigator.pushNamed(context, SettingsPage.routeName);
            }
          },
          itemBuilder: (BuildContext context) {
            return <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'moje objednávky',
                child: Text('moje objednávky'),
              ),
              const PopupMenuItem<String>(
                value: 'nastavenia',
                child: Text('nastavenia'),
              ),
            ];
          },
          color: ThemeColors.colorOnion,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
