import 'package:flutter/material.dart';
import 'package:food_blueprint/src/pages/order_show/order_show_page.dart';
import 'package:food_blueprint/src/pages/settings/settings_page.dart';
import 'package:food_blueprint/src/theme/theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;

  const CustomAppBar({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        text,
        style: const TextStyle(color: COLOR_TEXT, fontSize: 24),
      ),
      backgroundColor: COLOR_PRIMARY,
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
          color: COLOR_SECONDARY,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
