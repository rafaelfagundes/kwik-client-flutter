import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/screens/favorites/favorites_screen.dart';
import 'package:kwik_client_flutter/screens/notifications/notifications_screen.dart';
import 'package:kwik_client_flutter/screens/settings/settings_screen.dart';
import 'package:kwik_client_flutter/themes/dark_theme.dart';
import 'package:kwik_client_flutter/widgets/default_screen_widget.dart';

import './app_controller.dart';
import './themes/light_theme.dart';
import './widgets/bottom_tab_navigator_widget.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: AppController.instance.themeSwitch,
        builder: (context, isDark, child) {
          return MaterialApp(
              title: 'Kwik',
              theme: isDark ? darkTheme : lightTheme,
              home: DefaultTabController(
                length: 5,
                child: Scaffold(
                  body: TabBarView(
                    children: [
                      DefaultScreen('Home'),
                      Favorites(),
                      Container(
                        color: Colors.lightGreen,
                      ),
                      Notifications(),
                      Settings()
                    ],
                  ),
                  bottomNavigationBar: BottomTabNavigator(),
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                ),
              ));
        });
  }
}
