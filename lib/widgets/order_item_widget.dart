import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/screens/orders/order_status_widget.dart';
import 'package:kwik_client_flutter/utils/date_utils.dart';

class OrderItem extends StatelessWidget {
  final DateTime createdAt;
  final String title;
  final String description;
  final bool isNegative;
  final OrderStatusType status;

  OrderItem(
    Key key, {
    @required this.title,
    @required this.description,
    @required this.createdAt,
    @required this.status,
    this.isNegative = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Tapped');
      },
      onHorizontalDragStart: (details) => print(details),
      onHorizontalDragEnd: (details) => print(details),
      child: Container(
        margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
        padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
        width: double.infinity,
        height: 90.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: Theme.of(context).cardColor,
          boxShadow: [
            BoxShadow(
              color: const Color(0x0d000000),
              offset: Offset(0, 4),
              blurRadius: 16,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 6,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      DateUtils.verboseDate(createdAt).toUpperCase(),
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 9,
                        color: const Color(0xffa8a8a8),
                        letterSpacing: 0.0022500000000000003,
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    OrderStatusWidget(status)
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 18,
                    color: isNegative
                        ? Theme.of(context).errorColor
                        : Theme.of(context).primaryColor,
                    letterSpacing: 0.0045000000000000005,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  description,
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 13,
                    color: const Color(0xff7b7b7b),
                    letterSpacing: 0.0032500000000000003,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            Container(
              width: 64.0,
              height: 64.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.elliptical(32.0, 32.0)),
                image: DecorationImage(
                  image: const AssetImage('assets/images/StoreLogo.png'),
                  fit: BoxFit.cover,
                ),
                border: Border.all(width: 2.0, color: const Color(0xffffffff)),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x0d000000),
                    offset: Offset(0, 4),
                    blurRadius: 16,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
