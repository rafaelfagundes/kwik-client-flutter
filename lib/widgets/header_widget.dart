import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';

class Header extends StatelessWidget {
  final String title;
  final bool hasBackButton;
  final bool hasHelper;
  final Function helperFunction;
  final IconData helperIcon;

  Header(this.title,
      [this.hasBackButton = false,
      this.hasHelper = false,
      this.helperFunction,
      this.helperIcon]);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            hasBackButton ? Icon(SFSymbols.arrow_left, size: 28) : Container(),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).primaryColor,
                  ),
                  textAlign: TextAlign.left,
                ),
                hasHelper
                    ? Icon(helperIcon)
                    : SizedBox(
                        width: 28,
                      )
              ],
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
