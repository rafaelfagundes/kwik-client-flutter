import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListItemWidget extends StatelessWidget {
  final int qty;
  final String title;
  final double value;
  final bool bottomMargin;

  const ListItemWidget(
      {Key key,
      this.qty = 0,
      @required this.title,
      @required this.value,
      this.bottomMargin = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).brightness.toString() == "Brightness.dark";

    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                qty == 0
                    ? SizedBox(height: 32, width: 32)
                    : Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                            color: isDark
                                ? Color(0xffED7B84)
                                : Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Center(
                          child: Text(qty.toString() + 'x',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16)),
                        )),
                SizedBox(width: 10),
                Text(title,
                    style: TextStyle(
                        fontFamily: 'Lato',
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 14)),
              ],
            ),
            Text(
                NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$')
                    .format(value),
                style: TextStyle(
                    fontFamily: 'Lato',
                    color: isDark ? Color(0xFFA1E8AF) : Color(0xFF6BC273),
                    fontWeight: FontWeight.w700,
                    fontSize: 14)),
          ],
        ),
        SizedBox(height: bottomMargin ? 20 : 0),
      ],
    );
  }
}
