import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/widgets/header_widget.dart';
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
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Header('Meus Favoritos', true),
            Flexible(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return items[index];
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
