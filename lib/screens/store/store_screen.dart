import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kwik_client_flutter/screens/store/store_header.dart';

class Store extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double expandedHeight = (200 + MediaQuery.of(context).padding.top + 120);
    double collapsedHeight = MediaQuery.of(context).padding.top + 48;

    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
              delegate: StoreHeader(
                title: 'McDonald\'s',
                expandedHeight: expandedHeight,
                collapsedHeight: collapsedHeight,
              ),
              pinned: true,
              floating: true,
            ),
            SliverList(
                delegate: SliverChildListDelegate(<Widget>[
              Container(
                height: 70,
                color: Colors.yellow,
              ),
              Container(
                height: 70,
                color: Colors.green,
              ),
              Container(
                height: 70,
                color: Colors.blue,
              ),
              Container(
                height: 70,
                color: Colors.red,
              ),
              Container(
                height: 70,
                color: Colors.yellow,
              ),
              Container(
                height: 70,
                color: Colors.green,
              ),
              Container(
                height: 70,
                color: Colors.blue,
              ),
              Container(
                height: 70,
                color: Colors.red,
              ),
              Container(
                height: 70,
                color: Colors.yellow,
              ),
              Container(
                height: 70,
                color: Colors.green,
              ),
              Container(
                height: 70,
                color: Colors.blue,
              ),
              Container(
                height: 70,
                color: Colors.red,
              ),
              Container(
                height: 70,
                color: Colors.yellow,
              ),
              Container(
                height: 70,
                color: Colors.green,
              ),
              Container(
                height: 70,
                color: Colors.blue,
              ),
              Container(
                height: 70,
                color: Colors.red,
              ),
              Container(
                height: 70,
                color: Colors.yellow,
              ),
              Container(
                height: 70,
                color: Colors.green,
              ),
              Container(
                height: 70,
                color: Colors.blue,
              ),
              Container(
                height: 70,
                color: Colors.red,
              ),
            ]))
          ],
        ),
      ),
    ));
  }
}
