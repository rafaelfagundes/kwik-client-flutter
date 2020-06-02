import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';

class BottomTabNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      child: SafeArea(
        child: TabBar(
          labelColor: Theme.of(context).primaryColor,
          indicator: BoxDecoration(color: Theme.of(context).cardColor),
          tabs: <Widget>[
            const Tab(
              icon: Icon(SFSymbols.house),
            ),
            const Tab(
              icon: Icon(SFSymbols.tray_full),
            ),
            const Tab(
              icon: Icon(
                SFSymbols.cart,
              ),
            ),
            Tab(
              icon: Badge(
                animationType: BadgeAnimationType.scale,
                badgeContent: Text(
                  '10',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 9),
                ),
                child: Icon(SFSymbols.bell),
              ),
            ),
            const Tab(
              icon: Icon(SFSymbols.person_crop_circle),
            )
          ],
        ),
      ),
    );
  }
}
