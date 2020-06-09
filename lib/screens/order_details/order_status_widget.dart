import 'package:flutter/material.dart';

class OrderStatusWidget extends StatelessWidget {
  final int statusIndex = 3;

  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).brightness.toString() == "Brightness.dark";

    return Stack(
      children: <Widget>[
        Positioned(
          top: 7.5,
          right: 0,
          left: 0,
          child: Container(
            height: 1,
            width: MediaQuery.of(context).size.width,
            color: isDark ? Color(0xff606060) : Color(0xffc2c2c2),
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.109),
          ),
        ),
        Container(
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                          color: statusIndex == 0
                              ? isDark
                                  ? Theme.of(context).accentColor
                                  : Theme.of(context).primaryColor
                              : isDark ? Color(0xff606060) : Color(0xffc2c2c2),
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Aberto\nàs 18:57',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 9,
                          color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                          color: statusIndex == 1
                              ? isDark
                                  ? Theme.of(context).accentColor
                                  : Theme.of(context).primaryColor
                              : isDark ? Color(0xff606060) : Color(0xffc2c2c2),
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Confirmado\nàs 19:08',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 9,
                          color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                          color: statusIndex == 2
                              ? isDark
                                  ? Theme.of(context).accentColor
                                  : Theme.of(context).primaryColor
                              : isDark ? Color(0xff606060) : Color(0xffc2c2c2),
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Saiu para Entrega\nàs 19:21',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 9,
                          color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                          color: statusIndex == 3
                              ? isDark
                                  ? Theme.of(context).accentColor
                                  : Theme.of(context).primaryColor
                              : isDark ? Color(0xff606060) : Color(0xffc2c2c2),
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Entregue\nàs 20:30',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 9,
                          color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
