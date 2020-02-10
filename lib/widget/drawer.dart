import 'package:flutter/material.dart';

import 'package:acs_upb_mobile/generated/l10n.dart';
import 'package:acs_upb_mobile/routes/routes.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(
            icon: Icons.home,
            text: S.of(context).drawerHeaderHome,
            onTap: () => Navigator.pushReplacementNamed(context, Routes.home),
          ),
          _createDrawerItem(
            icon: Icons.public,
            text: S.of(context).drawerItemWebsites,
          ),
          _createDrawerItem(
            icon: Icons.calendar_today,
            text: S.of(context).drawerItemTimetable,
          ),
          _createDrawerItem(
            icon: Icons.class_,
            text: S.of(context).drawerItemClasses,
          ),
          _createDrawerItem(
            icon: Icons.library_books,
            text: S.of(context).drawerItemNews,
          ),
          _createDrawerItem(
            icon: Icons.map,
            text: S.of(context).drawerItemMap,
          ),
          _createDrawerItem(
            icon: Icons.people,
            text: S.of(context).drawerItemPeople,
          ),
          _createDrawerItem(
            icon: Icons.note,
            text: S.of(context).drawerItemNotes,
          ),
          Divider(),
          _createDrawerItem(
              icon: Icons.settings,
              text: S.of(context).drawerItemSettings,
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Routes.settings),
              dense: true),
          _createDrawerItem(
            icon: Icons.help,
            text: S.of(context).drawerItemHelp,
            dense: true,
          ),
          _createDrawerItem(
            icon: Icons.code,
            text: S.of(context).drawerItemContribute,
            dense: true,
          ),
        ],
      ),
    );
  }

  Widget _createHeader({IconData icon, String text, GestureTapCallback onTap}) {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            image: DecorationImage(
                alignment: Alignment.centerRight,
                fit: BoxFit.fill,
                image:
                    AssetImage('assets/images/drawer_header_backgroud.jpg'))),
        child: Stack(children: <Widget>[
          Positioned(
            bottom: 12.0,
            left: 16.0,
            child: GestureDetector(
              child: Row(
                children: <Widget>[
                  Icon(
                    icon,
                    size: 40,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      text,
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ],
              ),
              onTap: onTap,
            ),
          ),
        ]));
  }

  Widget _createDrawerItem(
      {IconData icon,
      String text,
      GestureTapCallback onTap,
      bool dense = false}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      dense: dense,
      onTap: onTap,
    );
  }
}