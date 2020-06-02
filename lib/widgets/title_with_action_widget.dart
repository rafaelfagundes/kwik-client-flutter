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
              title,
              style: TextStyle(
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: Theme.of(context).primaryColor),
            ),
            Text(
              actionText,
              style: TextStyle(
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: Theme.of(context).accentColor),
            ),
          ],
        ));
  }
}
