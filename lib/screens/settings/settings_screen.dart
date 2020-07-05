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

void _showAboutDialog(BuildContext context) {
  showAboutDialog(
    context: context,
    applicationIcon: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      width: 32,
      height: 32,
      child: Image.asset('assets/images/icon/purple/icon-512px.png'),
    ),
    applicationName: 'Kwik Entregas',
    applicationVersion: '1.0.0',
    applicationLegalese: '©2020 Rafael Fagundes',
    children: <Widget>[
      Padding(
          padding: EdgeInsets.only(top: 15),
          child: Text('Todos os direitos reservados'))
    ],
  );
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultScreen('Ajustes', children: <Widget>[
      ProfileItemWidget(),
      SizedBox(height: 16),
      SelectedCityWidget(),
      SizedBox(height: 10),
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
          title: 'Sobre',
          onPressed: () => _showAboutDialog(context),
          icon: SFSymbols.info_circle),
      MenuItemWidget(
          title: 'Ajuda', route: '/help', icon: SFSymbols.question_circle),
      SizedBox(height: 15),
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
