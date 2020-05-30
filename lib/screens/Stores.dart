import 'package:flutter/material.dart';

import '../widgets/StoreItem.dart';

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
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: SafeArea(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return items[index];
            },
          ),
          // child: ,
        ));
  }
}
