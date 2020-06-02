import 'package:flutter/material.dart';
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
