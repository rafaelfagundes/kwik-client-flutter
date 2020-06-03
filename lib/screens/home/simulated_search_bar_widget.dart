import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:kwik_client_flutter/app_controller.dart';

class SimulatedSearchBarWidget extends StatelessWidget {
  final bool _isDark = AppController.instance.isDark;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Row(
              children: <Widget>[
                Icon(SFSymbols.search,
                    color: _isDark ? Color(0xFFBBBBBB) : Color(0xFF666666)),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'O que você vai querer hoje?',
                  style: TextStyle(
                      fontFamily: 'Lato',
                      color: _isDark ? Color(0xFFBBBBBB) : Color(0xFF666666)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
