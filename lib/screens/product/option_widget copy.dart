import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OptionWidget extends StatelessWidget {
  final String label;
  final bool value;
  final bool groupValue;
  final double optionValue;
  final Function onChange;

  const OptionWidget({
    Key key,
    @required this.label,
    @required this.value,
    @required this.groupValue,
    @required this.optionValue,
    @required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Radio(value: value, groupValue: groupValue, onChanged: onChange),
              SizedBox(width: 10),
              Text(
                label,
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Theme.of(context).primaryColor),
              ),
            ],
          ),
          Text(
            NumberFormat.simpleCurrency(locale: 'pt_BR').format(optionValue),
            style: TextStyle(
                fontFamily: 'Lato',
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Color(0xff6BC273)),
          ),
        ],
      ),
    );
  }
}
