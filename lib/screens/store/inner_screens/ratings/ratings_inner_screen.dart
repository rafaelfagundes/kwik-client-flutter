import 'package:flutter/material.dart';

import 'rating_data_widget.dart';
import 'user_rating_wiget.dart';

class RatingsInner extends StatelessWidget {
  final List<Widget> items = [
    UserRatingWidget(),
    UserRatingWidget(),
    UserRatingWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double margin = 16.0;

    return Container(
      width: width - (2 * margin),
      margin: EdgeInsets.only(left: margin),
      child: Column(
        children: <Widget>[
          SizedBox(height: 16),
          RatingDataWidget(),
          SizedBox(height: 36),
          ...items
        ],
      ),
    );
  }
}
