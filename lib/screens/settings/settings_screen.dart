import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:kwik_client_flutter/widgets/default_screen_widget.dart';

import 'menu_item_widget.dart';
import 'profile_item_widget.dart';
import 'selected_city_widget.dart';
import 'theme_item_widget.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({
    Key key,
  }) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultScreen('Ajustes', children: <Widget>[
      ProfileItemWidget(),
      SizedBox(height: 26),
      SelectedCityWidget(),
      SizedBox(height: 12),
      MenuItemWidget(
          title: 'Endereços', route: '/adresses', icon: SFSymbols.map),
      MenuItemWidget(
          title: 'Favoritos', route: '/favorites', icon: SFSymbols.heart),
      MenuItemWidget(
          title: 'Cupons',
          route: '/coupons',
          icon: SFSymbols.tag,
          badgeCount: 8),
      ThemeItemWidget(),
      MenuItemWidget(
          title: 'Ajuda', route: '/help', icon: SFSymbols.question_circle),
      SizedBox(height: 32),
      MenuItemWidget(
        title: 'Sair',
        icon: SFSymbols.escape,
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(context, '/auth', (route) => false);
        },
      ),
    ]);
  }
}
