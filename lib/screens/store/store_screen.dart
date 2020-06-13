import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kwik_client_flutter/screen_arguments/store_arguments.dart';
import 'package:kwik_client_flutter/screens/store/inner_screens/highlights_inner_screen.dart';
import 'package:kwik_client_flutter/screens/store/inner_screens/information_inner_screen.dart';
import 'package:kwik_client_flutter/screens/store/inner_screens/products_inner_screen.dart';
import 'package:kwik_client_flutter/screens/store/inner_screens/ratings_inner_screen.dart';
import 'package:kwik_client_flutter/screens/store/store_menu_widget.dart';

import 'store_header_widget.dart';

class Store extends StatefulWidget {
  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> with SingleTickerProviderStateMixin {
  int _innerScreenIndex = 0;

  void _onChangeScreen(int index) {
    setState(() {
      _innerScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // double expandedHeight = (200 + MediaQuery.of(context).padding.top + 120);
    // double expandedHeight = (200 + MediaQuery.of(context).padding.top + 50);
    double expandedHeight = 280;
    double collapsedHeight = MediaQuery.of(context).padding.top + 48;

    final StoreArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
              delegate: StoreHeaderWidget(
                title: 'McDonald\'s',
                expandedHeight: expandedHeight,
                collapsedHeight: collapsedHeight,
                heroId: args.id,
                logo: args.logo,
                banner: args.banner,
                isOpen: true,
              ),
              pinned: true,
              floating: true,
            ),
            SliverList(
                delegate: SliverChildListDelegate(<Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: StoreMenuWidget(
                  onChangeScreen: _onChangeScreen,
                  index: _innerScreenIndex,
                ),
              ),
              IndexedStack(
                index: _innerScreenIndex,
                children: <Widget>[
                  HighlightsInner(),
                  ProductsInner(),
                  RatingsInner(),
                  InformationInner()
                ],
              )
            ]))
          ],
        ),
      ),
    ));
  }
}
