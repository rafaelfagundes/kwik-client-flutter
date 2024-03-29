import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kwik_client_flutter/widgets/integer_qty_widget.dart';

class ProductAditionalWidget extends StatelessWidget {
  final String label;
  final double value;
  final int qty;
  final Function onChange;

  const ProductAditionalWidget({
    Key key,
    @required this.label,
    @required this.value,
    @required this.qty,
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
              IntegerQtyWidget(
                value: qty,
                onChange: onChange,
                size: 22,
              ),
              SizedBox(width: 10),
              Container(
                width: MediaQuery.of(context).size.width - 200,
                child: Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Theme.of(context).primaryColor),
                ),
              ),
            ],
          ),
          Text(
            NumberFormat.simpleCurrency(locale: 'pt_BR').format(value),
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
