import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/modules/cart/cart_item.dart';
import 'package:kwik_client_flutter/modules/cart/cart_model.dart';
import 'package:kwik_client_flutter/modules/product/product_aditional_model.dart';
import 'package:kwik_client_flutter/modules/product/product_option_model.dart';
import 'package:kwik_client_flutter/utils/image_utils.dart';
import 'package:kwik_client_flutter/utils/theme_utils.dart';
import 'package:kwik_client_flutter/widgets/default_screen_widget.dart';

import 'cart_item_widget.dart';
import 'value_and_add_footer_widget.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cart = Cart(
      id: '246cf791-ff36-44ec-8add-3dbd381cdbe2',
      storeName: 'McDonald\'s',
      storeId: '61b9ed3a-699b-4f4a-bb54-40a102fa46da',
      cartTotal: 65,
      cartItems: [
        CartItem(
          id: 'c7fe0573-59ae-417e-a810-6af1f35a89d0',
          title: 'Big Mac',
          itemInitialPrice: 19.9,
          itemTotalPrice: 45,
          itemQty: 1,
          urlImage: ImageUtils.resizeCloudinaryImageFromUrl(
              'https://res.cloudinary.com/kardappio/image/upload/v1588019524/ixc1s8t8wxcbce3tudvf.jpg',
              76 * 3),
          productOptions: [
            ProductOption(
              label: 'Carne de Boi',
              value: '09b65640-23c6-4a45-9433-1d16ab513c74',
              optionPrice: 3,
            ),
            ProductOption(
              label: 'Queijo Cheddar',
              value: '641e8ca3-4611-4b50-9074-c95abf1650b5',
              optionPrice: 3,
            ),
            ProductOption(
              label: 'Molho da Casa',
              value: 'b3d2eec7-51db-4a5e-b29d-0e50513491dc',
              optionPrice: 3,
            ),
            ProductOption(
              label: 'Onion Rings',
              value: 'c0e908ef-cc7e-4f8e-a21e-3ee34dafe899',
              optionPrice: 3,
            ),
          ],
          additionalItems: [
            ProductAditional(label: 'Bacon', qty: 2, price: 8),
            ProductAditional(label: 'Picles', qty: 1, price: 4),
            ProductAditional(label: 'Molho Especial', qty: 1, price: 3),
            ProductAditional(label: 'Batata Frita', qty: 1, price: 8),
          ],
        ),
        CartItem(
          id: 'c7fe0573-59ae-417e-a810-6af1f35a89d0',
          title: 'Coca-Cola',
          itemInitialPrice: 5,
          itemTotalPrice: 5,
          itemQty: 2,
          urlImage: ImageUtils.resizeCloudinaryImageFromUrl(
              'https://res.cloudinary.com/kardappio/image/upload/v1588916689/nmnff7aiogoshq6gscu4.jpg',
              76 * 3),
          productOptions: [
            ProductOption(
                label: 'Lata - 350 ml',
                value: 'acf9ee54-5904-49c3-a8a9-24b05ef25f05',
                optionPrice: 0)
          ],
        ),
        CartItem(
          id: '007e4d40-9eab-4a0d-b7e0-927a483c2dda',
          title: 'Batata Frita Palito',
          itemInitialPrice: 8,
          itemTotalPrice: 8,
          itemQty: 1,
          urlImage: ImageUtils.resizeCloudinaryImageFromUrl(
              'https://res.cloudinary.com/kardappio/image/upload/v1587699685/t4x5ckmfasibhih61hwe.jpg',
              76 * 3),
          productOptions: [
            ProductOption(
              label: 'Média',
              value: '06ca28e5-29fe-4737-886e-03efb6c9eac4',
              optionPrice: 1,
            ),
          ],
        ),
      ],
    );

    var bottomBarSize = 48.0;

    var isDark = ThemeUtils.isDark(context);

    return Stack(
      children: <Widget>[
        DefaultScreen(
          'Carrinho',
          children: <Widget>[
            ...cart.cartItems.map((item) {
              return CartItemWidget(item: item);
            }),
            SizedBox(height: bottomBarSize),
          ],
        ),
        Positioned(
          bottom: 0,
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 65 + MediaQuery.of(context).padding.bottom,
                // color: Colors.transparent,
                color: Theme.of(context)
                    .scaffoldBackgroundColor
                    .withOpacity(isDark ? 0.3 : 0.85),
              ),
            ),
          ),
        ),
        ValueAndAddFooterWidget(
          label: 'Total do Carrinho',
          value: cart.cartTotal,
          valueSize: 16,
          onPressed: () {
            Navigator.pushNamed(context, '/cart-order-details');
          },
          // bottomPosition: bottomBarSize,
          bottomPosition: 5,
        ),
      ],
    );
  }
}
