import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';

class RatingStarsWidget extends StatelessWidget {
  final int starsSelected;
  final Function onChange;

  const RatingStarsWidget({Key key, this.starsSelected, this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _Star(starQty: 1, starsSelected: starsSelected, onChange: onChange),
        SizedBox(width: 15),
        _Star(starQty: 2, starsSelected: starsSelected, onChange: onChange),
        SizedBox(width: 15),
        _Star(starQty: 3, starsSelected: starsSelected, onChange: onChange),
        SizedBox(width: 15),
        _Star(starQty: 4, starsSelected: starsSelected, onChange: onChange),
        SizedBox(width: 15),
        _Star(starQty: 5, starsSelected: starsSelected, onChange: onChange),
      ],
    );
  }
}

class _Star extends StatelessWidget {
  final int starQty;
  final int starsSelected;
  final Function onChange;

  const _Star({Key key, this.starQty, this.starsSelected, this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (starQty == starsSelected) {
          onChange(starQty - 1);
        } else {
          onChange(starQty);
        }
      },
      child: Icon(
        SFSymbols.star_fill,
        color: starQty <= starsSelected
            ? Colors.yellow[600]
            : Theme.of(context).disabledColor,
      ),
    );
  }
}
