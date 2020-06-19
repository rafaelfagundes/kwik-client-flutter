import 'package:flutter/foundation.dart';

import 'product_aditional_model.dart';
import 'product_option_model.dart';

class CartItem {
  final String id;
  final String title;
  final double itemTotalPrice;
  final double itemInitialPrice;
  final int itemQty;
  final String urlImage;
  final List<ProductAditional> additionalItems;
  final List<ProductOption> productOptions;

  const CartItem({
    @required this.id,
    @required this.title,
    @required this.itemInitialPrice,
    @required this.itemTotalPrice,
    @required this.itemQty,
    this.additionalItems,
    @required this.productOptions,
    this.urlImage,
  });
}
