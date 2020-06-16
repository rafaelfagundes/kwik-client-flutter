import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/shared/enums.dart';
import 'package:kwik_client_flutter/widgets/default_screen_widget.dart';

import './coupon_item_widget.dart';

class Coupons extends StatelessWidget {
  final items = [
    CouponItem(ValueKey('#09gujokn9ij'),
        title: 'Cupom de 20%',
        couponCode: "SEUMADRUGA20",
        validUntil: new DateTime(2020, 12, 31),
        isValid: true,
        couponType: CouponType.PERCENTAGE,
        couponValue: 20),
    CouponItem(ValueKey('#gffdsa'),
        title: 'Cupom de R\$5',
        couponCode: "5REAU",
        validUntil: new DateTime(2020, 12, 31),
        isValid: true,
        couponType: CouponType.VALUE,
        couponValue: 5),
    CouponItem(ValueKey('#gffdffssa'),
        title: 'Cupom de 5%',
        couponCode: "CINQUINHO",
        validUntil: new DateTime(2020, 12, 31),
        isValid: false,
        couponType: CouponType.PERCENTAGE,
        couponValue: 5),
    CouponItem(ValueKey('#gfgXXXfdsa'),
        title: 'Cupom de 10%',
        couponCode: "DEZAO",
        validUntil: new DateTime(2020, 12, 31),
        isValid: false,
        couponType: CouponType.PERCENTAGE,
        couponValue: 10),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultScreen(
      'Cupons',
      children: <Widget>[...items],
    );
  }
}
