import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/widgets/default_screen_widget.dart';
import 'package:kwik_client_flutter/widgets/store_item_widget.dart';

class Favorites extends StatelessWidget {
  final items = [
    StoreItem(),
    StoreItem(),
    StoreItem(),
    StoreItem(),
    StoreItem(),
    StoreItem(),
    StoreItem(),
    StoreItem(),
    StoreItem(),
    StoreItem(),
    StoreItem(),
    StoreItem(),
    StoreItem(),
    StoreItem(),
    StoreItem(),
    StoreItem(),
    StoreItem(),
    StoreItem(),
    StoreItem(),
    StoreItem(),
    StoreItem(),
    StoreItem(),
    StoreItem(),
    StoreItem(),
    StoreItem()
  ];

  Favorites({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScreen(
      'Meus Favoritos',
      children: <Widget>[...items],
    );
  }
}
