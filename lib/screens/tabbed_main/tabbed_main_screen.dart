import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/screens/home/home_screen.dart';
import 'package:kwik_client_flutter/screens/notifications/notifications_screen.dart';
import 'package:kwik_client_flutter/screens/orders/orders_screen.dart';
import 'package:kwik_client_flutter/screens/settings/settings_screen.dart';
import 'package:kwik_client_flutter/screens/stores/stores_screen.dart';
import 'package:kwik_client_flutter/widgets/curved_navigation_widget.dart';

class TabbedMain extends StatefulWidget {
  @override
  _TabbedMainState createState() => _TabbedMainState();
}

class _TabbedMainState extends State<TabbedMain> {
  static final _screens = <Widget>[
    Home(),
    Orders(),
    Stores(),
    Notifications(),
    Settings()
  ];

  int _index = 0;

  void _handleIndexChange(index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_index],
      extendBody: true,
      bottomNavigationBar: CurvedNavigationWidget(_handleIndexChange, _index),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    );
  }
}
