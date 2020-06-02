import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DefaultScreen extends StatelessWidget {
  final List<Widget> children;
  final String title;
  DefaultScreen(this.title, {this.children = const []});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: CustomScrollView(slivers: <Widget>[
          CupertinoSliverNavigationBar(
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
              delegate: SliverChildListDelegate(
                  <Widget>[SizedBox(height: 20), ...children])),
        ]),
      ),
    );
  }
}
