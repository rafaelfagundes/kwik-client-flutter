import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kwik_client_flutter/screens/adresses/adresses_screen.dart';
import 'package:kwik_client_flutter/screens/coupons/coupons_screen.dart';
import 'package:kwik_client_flutter/screens/favorites/favorites_screen.dart';
import 'package:kwik_client_flutter/screens/rating/rating_screen.dart';
import 'package:kwik_client_flutter/screens/tabbed_main/tabbed_main_screen.dart';
import 'package:kwik_client_flutter/screens/user_profile/user_profile_screen.dart';
import 'package:kwik_client_flutter/stores/app_store.dart';
import 'package:kwik_client_flutter/themes/dark_theme.dart';
import 'package:provider/provider.dart';

import './themes/light_theme.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AppStore>(context);
    return Observer(
        builder: (_) => GestureDetector(
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);
                currentFocus.unfocus();

                if (!currentFocus.hasPrimaryFocus &&
                    currentFocus.focusedChild != null) {
                  currentFocus.focusedChild.unfocus();
                }
              },
              child: MaterialApp(
                title: 'Kwik',
                theme: store.isDark ? darkTheme : lightTheme,
                debugShowCheckedModeBanner: false,
                initialRoute: '/',
                onGenerateRoute: (settings) {
                  switch (settings.name) {
                    case '/':
                      return CupertinoPageRoute(
                          builder: (_) => TabbedMain(), settings: settings);
                    case '/favorites':
                      return CupertinoPageRoute(
                          builder: (_) => Favorites(), settings: settings);
                    case '/coupons':
                      return CupertinoPageRoute(
                          builder: (_) => Coupons(), settings: settings);
                    case '/rating':
                      return CupertinoPageRoute(
                          builder: (_) => Rating(), settings: settings);
                    case '/profile':
                      return CupertinoPageRoute(
                          builder: (_) => UserProfile(), settings: settings);
                    case '/adresses':
                      return CupertinoPageRoute(
                          builder: (_) => Adresses(), settings: settings);
                    default:
                      return CupertinoPageRoute(
                          builder: (_) => TabbedMain(), settings: settings);
                  }
                },
              ),
            ));
  }
}
