import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';

class Stars extends StatelessWidget {
  final int number;

  const Stars({
    Key key,
    this.number = 5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double starSize = 14;

    List<Widget> stars = [
      Icon(SFSymbols.star_fill, color: Color(0xffFFD166), size: starSize),
      Icon(SFSymbols.star_fill, color: Color(0xffFFD166), size: starSize),
      Icon(SFSymbols.star_fill, color: Color(0xffFFD166), size: starSize),
      Icon(SFSymbols.star_fill, color: Color(0xffFFD166), size: starSize),
      Icon(SFSymbols.star_fill, color: Color(0xffFFD166), size: starSize),
    ];

    stars.removeRange(number - 1, 4);

    return Container(
      child: Row(
        children: <Widget>[...stars],
      ),
    );
  }
}
