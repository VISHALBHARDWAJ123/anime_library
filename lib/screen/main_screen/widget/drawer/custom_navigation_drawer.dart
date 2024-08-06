import 'package:flutter/material.dart';
import 'package:mobx_examle/screen/main_screen/widget/drawer/widget/menu_item.dart';
import 'package:mobx_examle/utils/app_export.dart';

class CustomNavigationDrawer extends StatelessWidget {
  const CustomNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/header.png'),
        const SizedBox(
          height: 20,
        ),
        ...[
          Menu(
            Icons.people,
            'Anime Characters',
            routeName: animeCharactersPageRoute,
          ),
          Menu(
            Icons.notifications_active,
            routeName: newsPageRoute,
            'News',
          ),
          Menu(
            routeName: upcomingSeasonsPageRoute,
            Icons.upcoming,
            'Upcoming Seasons',
          ),
          Menu(
            routeName: settingPageRoute,
            Icons.settings,
            'Setting',
          ),
        ].map(
          (menu) => SliderMenuItem(
            title: menu.title,
            iconData: menu.iconData,
            onTap: () => goToScreen(
              routeName: menu.routeName,
              context: context,
            ),
          ),
        ),
      ],
    );
  }
}
