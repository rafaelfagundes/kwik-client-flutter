import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/screens/home/business_type_widget.dart';
import 'package:kwik_client_flutter/screens/home/simulated_search_bar_widget.dart';
import 'package:kwik_client_flutter/screens/home/store_horizontal_list_widget.dart';
import 'package:kwik_client_flutter/widgets/default_screen_widget.dart';

import 'banner_widget.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultScreen(
      'Olá, Rafael',
      children: <Widget>[
        SimulatedSearchBarWidget(),
        SizedBox(
          height: 10,
        ),
        BannerWidget(),
        SizedBox(
          height: 20,
        ),
        BusinessTypeWidget(),
        SizedBox(
          height: 5,
        ),
        StoreHorizontalListWidget('Restaurantes'),
        SizedBox(
          height: 30,
        ),
        // StoreHorizontalListWidget('Lojas'),
        SizedBox(
          height: 30,
        ),
        // StoreHorizontalListWidget('Visitados Recentemente'),
        SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
