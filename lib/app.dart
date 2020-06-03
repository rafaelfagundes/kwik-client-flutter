import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/screens/favorites/favorites_screen.dart';
import 'package:kwik_client_flutter/screens/home/home_screen.dart';
import 'package:kwik_client_flutter/screens/notifications/notifications_screen.dart';
import 'package:kwik_client_flutter/screens/settings/settings_screen.dart';
import 'package:kwik_client_flutter/themes/dark_theme.dart';
import 'package:kwik_client_flutter/widgets/curved_navigation_widget.dart';

import './app_controller.dart';
import './themes/light_theme.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  static final _screens = <Widget>[
    Home(),
    Favorites(),
    Container(
      color: Colors.lightGreen,
    ),
    Notifications(),
    Settings()
  ];

  int _index = 0;

  @override
  void _handleIndexChange(index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: AppController.instance.themeSwitch,
        builder: (context, isDark, child) {
          return MaterialApp(
              title: 'Kwik',
              theme: isDark ? darkTheme : lightTheme,
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: _screens[_index],
                extendBody: true,
                bottomNavigationBar:
                    CurvedNavigationWidget(_handleIndexChange, _index),
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              ));
        });
  }
}
