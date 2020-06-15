import 'package:flutter/material.dart';

import 'rating_bar_widget.dart';

class RatingBarsWidget extends StatelessWidget {
  const RatingBarsWidget({
    Key key,
    @required this.barWidth,
    @required this.barSpacer,
  }) : super(key: key);

  final double barWidth;
  final double barSpacer;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          RatingBarWidget(
              barWidth: barWidth,
              numberOfStars: 5,
              barFillPercentage: 0.65,
              barColor: Color(0xff04A777)),
          SizedBox(height: barSpacer),
          RatingBarWidget(
              barWidth: barWidth,
              numberOfStars: 4,
              barFillPercentage: 0.15,
              barColor: Color(0xff36E774)),
          SizedBox(height: barSpacer),
          RatingBarWidget(
              barWidth: barWidth,
              numberOfStars: 3,
              barFillPercentage: 0.1,
              barColor: Color(0xffFFD400)),
          SizedBox(height: barSpacer),
          RatingBarWidget(
              barWidth: barWidth,
              numberOfStars: 2,
              barFillPercentage: 0.1,
              barColor: Color(0xffF2AF29)),
          SizedBox(height: barSpacer),
          RatingBarWidget(
              barWidth: barWidth,
              numberOfStars: 1,
              barFillPercentage: 0.1,
              barColor: Color(0xffD90368)),
        ],
      ),
    );
  }
}
