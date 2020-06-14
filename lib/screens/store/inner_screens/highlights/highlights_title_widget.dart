import 'package:flutter/material.dart';

class HighlightsTitleWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconColor;
  final Color color;

  const HighlightsTitleWidget({
    Key key,
    this.title,
    this.icon,
    this.iconColor,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: <Widget>[
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.all(Radius.circular(4))),
            child: Center(
                child: Icon(
              icon,
              color: iconColor,
              size: 12,
            )),
          ),
          SizedBox(width: 5),
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
