import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/screens/cart/cart_screen.dart';
import 'package:kwik_client_flutter/screens/home/home_screen.dart';
import 'package:kwik_client_flutter/screens/notifications/notifications_screen.dart';
import 'package:kwik_client_flutter/screens/orders/orders_screen.dart';
import 'package:kwik_client_flutter/screens/settings/settings_screen.dart';
import 'package:kwik_client_flutter/widgets/curved_navigation_widget.dart';

class TabbedMain extends StatefulWidget {
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  const TabbedMain({Key key, this.analytics, this.observer}) : super(key: key);

  @override
  _TabbedMainState createState() => _TabbedMainState();
}

class _TabbedMainState extends State<TabbedMain> {
  static final _screens = <Widget>[
    HomeScreen(),
    OrdersScreen(),
    CartScreen(),
    NotificationsScreen(),
    SettingsScreen()
  ];

  int _index = 0;

  void _handleIndexChange(index) async {
    setState(() {
      _index = index;
    });
    switch (index) {
      case 0:
        await widget.analytics.setCurrentScreen(screenName: '/home');
        break;
      case 1:
        await widget.analytics.setCurrentScreen(screenName: '/orders');
        break;
      case 2:
        await widget.analytics.setCurrentScreen(screenName: '/cart');
        break;
      case 3:
        await widget.analytics.setCurrentScreen(screenName: '/notifications');
        break;
      case 4:
        await widget.analytics.setCurrentScreen(screenName: '/settings');
        break;
      default:
        await widget.analytics.setCurrentScreen(screenName: '/home');
    }
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
