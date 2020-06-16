import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kwik_client_flutter/shared/enums.dart';

class DiscountBadgeWidget extends StatelessWidget {
  const DiscountBadgeWidget({
    Key key,
    @required this.discountValue,
    this.discountType = DiscountType.PERCENTAGE,
  }) : super(key: key);

  final double discountValue;
  final DiscountType discountType;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      height: 22,
      decoration: BoxDecoration(
          color: Color(0xffEF5D60),
          borderRadius: BorderRadius.all(Radius.circular(4))),
      child: Center(
        child: Text(
          discountType == DiscountType.PERCENTAGE
              ? '${discountValue.toString().replaceAll('.0', '')}%'
              : '-${NumberFormat.simpleCurrency(locale: 'pt_BR').format(discountValue)}',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Lato',
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
