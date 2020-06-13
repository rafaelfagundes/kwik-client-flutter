import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultScreen extends StatelessWidget {
  final List<Widget> children;
  final String title;
  final AssetImage icon;

  DefaultScreen(this.title, {this.icon, this.children = const []});

  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).brightness.toString() == "Brightness.dark";

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
              // style: TextStyle(
              //   color: Theme.of(context).primaryColor,
              //   fontFamily: 'Lato',
              //   fontWeight: FontWeight.w900,
              // ),
              // raleway / sen (ls -1.5) / poppins (ls -1)
              style: GoogleFonts.sen(
                // color: Theme.of(context).primaryColor,
                color: isDark ? Color(0xff23B5D3) : Color(0xff0B5383),
                fontWeight: FontWeight.w700,
                letterSpacing: -1.5,
              ),
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
