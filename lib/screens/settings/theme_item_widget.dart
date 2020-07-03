import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';

import './dark_mode_switch.dart';

class ThemeItemWidget extends StatelessWidget {
  const ThemeItemWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      height: 45,
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                SFSymbols.circle_lefthalf_fill,
                size: 26,
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Tema',
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 14,
                  color: Theme.of(context).primaryColor,
                  letterSpacing: 0.004,
                ),
                textAlign: TextAlign.left,
              )
            ],
          ),
          DarkModeSwitch(),
        ],
      ),
    );
  }
}
