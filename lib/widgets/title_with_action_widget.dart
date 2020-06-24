import 'package:flutter/material.dart';

class TitleWithActionWidget extends StatelessWidget {
  final String title;
  final String actionText;

  TitleWithActionWidget(this.title, this.actionText);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              title.toUpperCase(),
              style: TextStyle(
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w700,
                  fontSize: 11,
                  color: Theme.of(context).primaryColor),
            ),
            Text(
              actionText.toUpperCase(),
              style: TextStyle(
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w700,
                  fontSize: 10,
                  color: Theme.of(context).accentColor),
            ),
          ],
        ));
  }
}
