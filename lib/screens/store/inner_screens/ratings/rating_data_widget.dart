import 'package:flutter/material.dart';

import 'rating_bars_widget.dart';
import 'rating_summary_widget.dart';

class RatingDataWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double barWidth = MediaQuery.of(context).size.width - 181;
    double barSpacer = 7.0;

    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          RatingSummary(),
          RatingBarsWidget(barWidth: barWidth, barSpacer: barSpacer),
        ],
      ),
    );
  }
}
