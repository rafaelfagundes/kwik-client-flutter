import 'package:flutter/material.dart';

enum CouponType { VALUE, PERCENTAGE }

class CouponItem extends StatelessWidget {
  final DateTime validUntil;
  final String title;
  final String couponCode;
  final bool isValid;
  final CouponType couponType;
  final double couponValue;

  CouponItem(Key key,
      {@required this.title,
      @required this.couponCode,
      @required this.validUntil,
      @required this.isValid,
      @required this.couponType,
      @required this.couponValue})
      : super(key: key);

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
          color: Theme.of(context).cardColor.withOpacity(!isValid ? 0.5 : 1),
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
                Text(
                  'VÁLIDO ATÉ ' + validUntil.toString(),
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
                  height: 6,
                ),
                Text(
                  title,
                  style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 18,
                      color: isValid
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).disabledColor,
                      letterSpacing: 0.0045000000000000005,
                      fontWeight: FontWeight.w700,
                      decoration: isValid ? null : TextDecoration.lineThrough),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 6,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: Theme.of(context).errorColor,
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                  child: Text(
                    couponCode,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Lato'),
                  ),
                )
              ],
            ),
            Container(
              width: 64.0,
              height: 64.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.elliptical(32.0, 32.0)),
                border: Border.all(width: 2.0, color: const Color(0xffffffff)),
                color: Theme.of(context).errorColor,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x0d000000),
                    offset: Offset(0, 4),
                    blurRadius: 16,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  couponType == CouponType.PERCENTAGE
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(couponValue.toInt().toString(),
                                style: TextStyle(
                                    fontFamily: 'Lato',
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700)),
                            Container(
                              padding: EdgeInsets.only(top: 3, left: 0.5),
                              child: Text('%',
                                  style: TextStyle(
                                    fontFamily: 'Lato',
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  )),
                            ),
                          ],
                        )
                      : Row(
                          children: [
                            Text('R\$',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                )),
                            Text(couponValue.toInt().toString(),
                                style: TextStyle(
                                    fontFamily: 'Lato',
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700)),
                          ],
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
