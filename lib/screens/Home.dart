import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';

import './Settings.dart';

class Home extends StatelessWidget {
  final String title;
  Home(this.title);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: TabBarView(
          children: [
            Container(
              color: Colors.yellow,
            ),
            Container(
              color: Colors.orange,
            ),
            Container(
              color: Colors.lightGreen,
            ),
            Container(
              color: Colors.red,
            ),
            Settings()
          ],
        ),
        bottomNavigationBar: SafeArea(
          child: TabBar(
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor: Theme.of(context).disabledColor,
            indicator:
                BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor),
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
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }
}
