import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:kwik_client_flutter/app_controller.dart';
import 'package:kwik_client_flutter/widgets/business_type_button_widget.dart';
import 'package:kwik_client_flutter/widgets/default_screen_widget.dart';
import 'package:kwik_client_flutter/widgets/title_with_action_widget.dart';

class Home extends StatelessWidget {
  final bool _isDark = AppController.instance.isDark;

  @override
  Widget build(BuildContext context) {
    return DefaultScreen(
      'Olá, Rafael',
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
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
                    color: _isDark ? Color(0xFFBBBBBB) : Color(0xFF666666)),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        GestureDetector(
            onTap: () {
              print('Delivery');
            },
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: _isDark
                    ? Image.asset('assets/images/banners/Delivery-Dark.png')
                    : Image.asset('assets/images/banners/Delivery-Light.png'))),
        SizedBox(
          height: 15,
        ),
        TitleWithActionWidget('Seções', 'Ver Todas'),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 90,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              BusinessTypeButtonWidget(),
              BusinessTypeButtonWidget(),
              BusinessTypeButtonWidget(),
              BusinessTypeButtonWidget(),
              BusinessTypeButtonWidget(),
              BusinessTypeButtonWidget(),
              BusinessTypeButtonWidget(),
            ],
          ),
        ),
        SizedBox(
          height: 25,
        ),
        TitleWithActionWidget('Restaurantes', 'Ver Todos'),
      ],
    );
  }
}
