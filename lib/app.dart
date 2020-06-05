import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kwik_client_flutter/screens/coupons/coupons_screen.dart';
import 'package:kwik_client_flutter/screens/favorites/favorites_screen.dart';
import 'package:kwik_client_flutter/screens/stores/stores_screen.dart';
import 'package:kwik_client_flutter/screens/tabbed_main/tabbed_main_screen.dart';
import 'package:kwik_client_flutter/stores/app_store.dart';
import 'package:kwik_client_flutter/themes/dark_theme.dart';
import 'package:provider/provider.dart';

import './themes/light_theme.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AppStore>(context);
    return Observer(
        builder: (_) => MaterialApp(
                title: 'Kwik',
                theme: store.isDark ? darkTheme : lightTheme,
                debugShowCheckedModeBanner: false,
                initialRoute: '/',
                routes: {
                  '/': (context) => TabbedMain(),
                  '/favorites': (context) => Favorites(),
                  '/coupons': (context) => Coupons(),
                  '/rating': (context) => Stores(),
                }));
  }
}
