import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DefaultScreen extends StatelessWidget {
  final List<Widget> children;
  final String title;
  final AssetImage icon;

  DefaultScreen(this.title, {this.icon, this.children = const []});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Container(
        child: CustomScrollView(slivers: <Widget>[
          CupertinoSliverNavigationBar(
            actionsForegroundColor: Theme.of(context).primaryColor,
            automaticallyImplyTitle: true,
            automaticallyImplyLeading: true,
            transitionBetweenRoutes: true,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            border: null,
            largeTitle: Text(
              title,
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w400),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate(<Widget>[
            SizedBox(height: 20),
            ...children,
            SizedBox(height: 72)
          ])),
        ]),
      ),
    );
  }
}
