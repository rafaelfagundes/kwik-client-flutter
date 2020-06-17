import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TotalValueWidget extends StatelessWidget {
  final String label;
  final double value;
  final double valueSize;

  const TotalValueWidget({
    Key key,
    @required this.label,
    @required this.value,
    this.valueSize = 22,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(label.toUpperCase(),
              style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 12,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 2),
          Text(
            NumberFormat.simpleCurrency(locale: 'pt_BR').format(value),
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: valueSize,
              color: Color(0xFF6BC273),
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}
