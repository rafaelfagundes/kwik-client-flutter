import 'package:flutter/material.dart';

import 'stars_widget.dart';

class RatingSummary extends StatelessWidget {
  const RatingSummary({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '4.8',
            style: TextStyle(
              height: 1,
              fontFamily: 'Lato',
              fontSize: 36,
              fontWeight: FontWeight.w900,
              color: Theme.of(context).primaryColor,
            ),
          ),
          SizedBox(height: 5),
          Stars(number: 5),
          SizedBox(height: 10),
          Text('538 avaliações',
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: Color(0xffA5A5A5),
              ))
        ],
      ),
    );
  }
}
