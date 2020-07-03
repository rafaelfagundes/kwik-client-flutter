import 'package:flutter/material.dart';

import 'rating_data_widget.dart';
import 'user_rating_wiget.dart';

class RatingsInner extends StatelessWidget {
  final List<Widget> items = [
    UserRatingWidget(key: ValueKey('4f780df5-c986-4235-8cee-d503931fc2b7')),
    UserRatingWidget(key: ValueKey('1c1bf1ac-c0ac-4e63-8772-5fa587588979')),
    UserRatingWidget(key: ValueKey('91199ece-727a-46ba-9c30-b8d7b5b8d55a')),
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
          ...items,
          SizedBox(height: 72),
        ],
      ),
    );
  }
}
