import 'package:flutter/foundation.dart';

import 'cart_item.dart';

class Cart {
  final String id;
  final String storeName;
  final String storeId;
  final double cartTotal;
  final List<CartItem> cartItems;

  const Cart({
    @required this.id,
    @required this.storeName,
    @required this.storeId,
    @required this.cartTotal,
    @required this.cartItems,
  });
}
