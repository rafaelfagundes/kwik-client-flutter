import 'package:cupertino_tabbar/cupertino_tabbar.dart';
import 'package:flutter/material.dart';

class GenderSwitchWidget extends StatefulWidget {
  @override
  _GenderSwitchWidgetState createState() => _GenderSwitchWidgetState();
}

class _GenderSwitchWidgetState extends State<GenderSwitchWidget> {
  int cupertinoTabBarValue = 0;

  int cupertinoTabBarValueGetter() => cupertinoTabBarValue;

  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).brightness.toString() == "Brightness.dark";

    return Container(
      height: 60,
      child: CupertinoTabBar(
          isDark ? Color(0xFF232323) : Color(0xFFE7E7E7),
          isDark ? Color(0xFF800080) : Color(0xFF440044),
          [
            Container(
              height: 60,
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Feminino",
                    style: TextStyle(
                      color: cupertinoTabBarValue == 0
                          ? Colors.white
                          : Color(0xFF939393),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Lato",
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Container(
              height: 60,
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Masculino",
                    style: TextStyle(
                      color: cupertinoTabBarValue == 1
                          ? Colors.white
                          : Color(0xFF939393),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Lato",
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Container(
              height: 60,
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Não-Binário",
                    style: TextStyle(
                      color: cupertinoTabBarValue == 2
                          ? Colors.white
                          : Color(0xFF939393),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Lato",
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ], //_widgets
          cupertinoTabBarValueGetter, //_valueGetter
          (int index) {
        setState(() {
          cupertinoTabBarValue = index;
        });
      },
          useSeparators: false,
          verticalPadding: 60,
          borderRadius: const BorderRadius.all(const Radius.circular(8)),
          duration: const Duration(milliseconds: 250)),
    );
  }
}
