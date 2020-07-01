import 'dart:ui';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';

class CurvedNavigationWidget extends StatelessWidget {
  // final Function setPageIndex = null;

  final Function setPageIndex;
  final int index;
  static const double _buttonSize = 24;

  CurvedNavigationWidget(this.setPageIndex, this.index);

  double _getBlurHeight(BuildContext context) {
    double height = MediaQuery.of(context).padding.bottom > 0 ? 75 : 50;
    return height;
  }

  double _getBarHeight(BuildContext context) {
    double height = MediaQuery.of(context).padding.bottom > 0
        ? 75 - MediaQuery.of(context).padding.bottom
        : 50;
    return height;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        if (index != 2)
          Positioned(
            bottom: 0,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  // height: 50,
                  // iphone x = 34 || iphone 8 = 0
                  height: _getBlurHeight(context),
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
        Container(
          child: SafeArea(
            child: CurvedNavigationBar(
              height: _getBarHeight(context),
              animationDuration: Duration(milliseconds: 350),
              backgroundColor: Colors.transparent,
              buttonBackgroundColor: Theme.of(context).accentColor,
              color: Theme.of(context).cardColor,
              items: <Widget>[
                CustomIcon(
                  isActive: index == 0,
                  buttonSize: _buttonSize,
                  activeIcon: SFSymbols.house_fill,
                  inactiveIcon: SFSymbols.house,
                ),
                CustomIcon(
                  isActive: index == 1,
                  buttonSize: _buttonSize,
                  activeIcon: SFSymbols.tray_full_fill,
                  inactiveIcon: SFSymbols.tray_full,
                ),
                CustomIcon(
                  isActive: index == 2,
                  buttonSize: _buttonSize,
                  activeIcon: SFSymbols.cart_fill,
                  inactiveIcon: SFSymbols.cart,
                ),
                CustomIcon(
                  isActive: index == 3,
                  buttonSize: _buttonSize,
                  activeIcon: SFSymbols.bell_fill,
                  inactiveIcon: SFSymbols.bell,
                ),
                CustomIcon(
                  isActive: index == 4,
                  buttonSize: _buttonSize,
                  activeIcon: SFSymbols.person_circle_fill,
                  inactiveIcon: SFSymbols.person_circle,
                ),
              ],
              onTap: (index) {
                setPageIndex(index);
              },
            ),
          ),
        ),
      ],
    );
  }
}

class CustomIcon extends StatelessWidget {
  final IconData activeIcon;
  final IconData inactiveIcon;
  final bool isActive;
  final double buttonSize;

  const CustomIcon(
      {Key key,
      this.activeIcon,
      this.inactiveIcon,
      this.isActive,
      this.buttonSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      child: isActive
          ? Icon(
              activeIcon,
              size: buttonSize,
              color: Colors.white,
            )
          : Icon(
              inactiveIcon,
              size: buttonSize,
              color: Theme.of(context).primaryColor,
            ),
    );
  }
}
