import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:kwik_client_flutter/widgets/header_widget.dart';
import 'package:kwik_client_flutter/widgets/store_item_widget.dart';

class Stores extends StatelessWidget {
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

  Stores({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Header(
            'Restaurantes', false, true, null, SFSymbols.slider_horizontal_3),
        Flexible(
          fit: FlexFit.loose,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return items[index];
            },
          ),
        ),
      ],
    );
  }
}
