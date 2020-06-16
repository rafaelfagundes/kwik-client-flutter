import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/shared/enums.dart';

class ProductArguments {
  final String id;
  final String heroId;
  final String logo;
  final String banner;
  final String title;
  final bool hasDiscount;
  final double value;
  final double oldValue;
  final double discountValue;
  final DiscountType discountType;

  ProductArguments({
    this.discountValue = 0,
    this.discountType = DiscountType.PERCENTAGE,
    @required this.title,
    @required this.hasDiscount,
    @required this.value,
    @required this.oldValue,
    @required this.id,
    @required this.heroId,
    @required this.logo,
    @required this.banner,
  });
}
