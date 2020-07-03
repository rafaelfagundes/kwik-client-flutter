import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/shared/enums.dart';
import 'package:kwik_client_flutter/utils/image_utils.dart';
import 'package:kwik_client_flutter/widgets/custom_expansion_tile_widget.dart';
import 'package:kwik_client_flutter/widgets/product_menu_item_widget.dart';

class ProductsInner extends StatelessWidget {
  final String logo;

  const ProductsInner({Key key, this.logo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var items = [
      ProductMenuItem(
        id: 'ba8483a8-f9e5-4016-b81e-1c66b0d9c90a',
        title: 'Cheeseburger',
        description: 'Hambúrguer, tomate, alface, ovo, molho especial',
        urlImage: ImageUtils.resizeCloudinaryImageFromUrl(
            'https://res.cloudinary.com/kardappio/image/upload/v1590474919/kfoxtra5sba8n3rltrdb.jpg',
            56,
            context),
        oldPrice: 22.9,
        price: 18.9,
        discountType: DiscountType.PERCENTAGE,
        discountValue: 10,
        hasDiscount: true,
        logo: logo,
      ),
      ProductMenuItem(
        id: '06570c8b-9c85-44e4-9960-d8a2414198df',
        title: 'Hot Dog',
        description: 'Hot Dog da Casa',
        urlImage: ImageUtils.resizeCloudinaryImageFromUrl(
          'https://res.cloudinary.com/kardappio/image/upload/v1589316934/cmwq0base1pehgynnoo1.jpg',
          56,
          context,
        ),
        price: 9.9,
        hasDiscount: false,
        logo: logo,
      ),
      ProductMenuItem(
        id: '78495b47-c07d-4115-8eff-c4128fcd90ad',
        title: 'Pizza Portuguesa',
        description: 'Tomate, presunto, queijo, orégano, molho de tomate',
        urlImage: ImageUtils.resizeCloudinaryImageFromUrl(
          'https://res.cloudinary.com/kardappio/image/upload/v1588929197/epadazqdd3wpa62jtmux.jpg',
          56,
          context,
        ),
        price: 39.9,
        hasDiscount: false,
        logo: logo,
      ),
    ];

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: <Widget>[
          Divider(),
          CustomExpansionTile(
            tilePadding: EdgeInsets.all(0),
            initiallyExpanded: true,
            title: Text(
              'Carne de Boi',
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            children: <Widget>[...items],
          ),
          SizedBox(height: 72),
        ],
      ),
    );
  }
}
