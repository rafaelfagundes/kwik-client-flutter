import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:kwik_client_flutter/utils/theme_utils.dart';

class RatingBarWidget extends StatelessWidget {
  final int numberOfStars;
  final double barFillPercentage;
  final Color barColor;

  const RatingBarWidget({
    Key key,
    @required this.barWidth,
    this.numberOfStars,
    this.barFillPercentage,
    this.barColor,
  }) : super(key: key);

  final double barWidth;

  @override
  Widget build(BuildContext context) {
    var isDark = ThemeUtils.isDark(context);

    return Container(
      child: Row(
        children: <Widget>[
          Container(
            width: 14,
            height: 14,
            child: Center(
              child: Text(
                numberOfStars.toString(),
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
          Container(
            width: 14,
            height: 14,
            // padding: EdgeInsets.only(top: 1),
            child: Center(
              child: Icon(
                SFSymbols.star_fill,
                color: Color(0xffFFD166),
                size: 14,
              ),
            ),
          ),
          SizedBox(width: 5),
          Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 4),
                decoration: BoxDecoration(
                  color: isDark ? Color(0xff3F3F3F) : Color(0xffE7E7E7),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                height: 10,
                width: barWidth,
              ),
              Container(
                margin: EdgeInsets.only(top: 4),
                decoration: BoxDecoration(
                  color: barColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                height: 10,
                width: barWidth * barFillPercentage,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
