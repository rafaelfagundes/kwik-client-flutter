import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_navigation_bar_widget.dart';

class DefaultScreen extends StatelessWidget {
  final List<Widget> children;
  final String title;
  final AssetImage icon;
  final bool paddingTop;

  DefaultScreen(
    this.title, {
    this.icon,
    @required this.children,
    this.paddingTop = true,
  });

  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).brightness.toString() == "Brightness.dark";

    return Scaffold(
      extendBody: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Container(
        child: CustomScrollView(slivers: <Widget>[
          CustomCupertinoSliverNavigationBar(
            actionsForegroundColor: Theme.of(context).primaryColor,
            automaticallyImplyTitle: true,
            automaticallyImplyLeading: true,
            transitionBetweenRoutes: true,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            border: null,
            largeTitle: Text(
              title,
              // raleway / sen (ls -1.5) / poppins (ls -1)
              style: GoogleFonts.sen(
                color: isDark ? Color(0xffFFFFFF) : Color(0xff0B5383),
                fontWeight: FontWeight.w700,
                letterSpacing: -1.5,
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate(<Widget>[
            if (paddingTop) SizedBox(height: 20),
            ...children,
            SizedBox(height: 72)
          ])),
        ]),
      ),
    );
  }
}
