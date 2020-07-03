import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/shared/enums.dart';
import 'package:kwik_client_flutter/widgets/default_screen_widget.dart';

import './coupon_item_widget.dart';

class CouponsScreen extends StatelessWidget {
  final items = [
    CouponItem(
      ValueKey('38fa3d2e-ea0d-4e84-a647-014200243443'),
      id: '38fa3d2e-ea0d-4e84-a647-014200243443',
      title: 'Cupom de 20%',
      couponCode: "SEUMADRUGA20",
      validUntil: new DateTime(2020, 12, 31),
      isValid: true,
      couponType: DiscountType.PERCENTAGE,
      couponValue: 20,
    ),
    CouponItem(
      ValueKey('0443f7e5-9a25-4d8e-99f2-b9cd0eccc271'),
      id: '0443f7e5-9a25-4d8e-99f2-b9cd0eccc271',
      title: 'Cupom de R\$5',
      couponCode: "5REAU",
      validUntil: new DateTime(2020, 12, 31),
      isValid: true,
      couponType: DiscountType.VALUE,
      couponValue: 5,
    ),
    CouponItem(
      ValueKey('fbcb42e6-c610-4ecd-b6f4-0aec4d47a68d'),
      id: 'fbcb42e6-c610-4ecd-b6f4-0aec4d47a68d',
      title: 'Cupom de 5%',
      couponCode: "CINQUINHO",
      validUntil: new DateTime(2020, 12, 31),
      isValid: false,
      couponType: DiscountType.PERCENTAGE,
      couponValue: 5.1,
    ),
    CouponItem(
      ValueKey('8d3763ad-51b6-4ceb-8e52-911e5ea7e520'),
      id: '8d3763ad-51b6-4ceb-8e52-911e5ea7e520',
      title: 'Cupom de 10%',
      couponCode: "DEZAO",
      validUntil: new DateTime(2020, 12, 31),
      isValid: false,
      couponType: DiscountType.PERCENTAGE,
      couponValue: 10,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultScreen(
      'Cupons',
      children: <Widget>[...items],
    );
  }
}
