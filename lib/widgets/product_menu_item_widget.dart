import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kwik_client_flutter/screen_arguments/product_arguments.dart';
import 'package:kwik_client_flutter/shared/enums.dart';

import 'rounded_square_product_image_widget.dart';

class ProductMenuItem extends StatelessWidget {
  final bool hasBottomMargin;
  final String id;
  final String urlImage;
  final String logo;
  final String title;
  final String description;
  final double price;
  final double oldPrice;
  final bool hasDiscount;
  final DiscountType discountType;
  final double discountValue;

  const ProductMenuItem({
    Key key,
    this.hasBottomMargin,
    @required this.id,
    @required this.urlImage,
    @required this.logo,
    @required this.title,
    @required this.description,
    @required this.price,
    this.oldPrice,
    @required this.hasDiscount,
    this.discountType,
    this.discountValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/product',
          arguments: ProductArguments(
            id: id,
            heroId: id,
            logo: logo,
            banner: urlImage,
            hasDiscount: hasDiscount,
            discountType: discountType,
            discountValue: discountValue,
            oldValue: oldPrice,
            title: title,
            value: price,
          ),
        );
      },
      child: Container(
        color: Colors.transparent,
        margin: EdgeInsets.only(bottom: 16),
        width: MediaQuery.of(context).size.width - 48,
        child: Row(
          children: <Widget>[
            RoundedSquareProductImageWidget(
              url: urlImage,
              heroId: id,
            ),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontFamily: 'Lato',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor.withOpacity(0.65),
                        fontFamily: 'Lato',
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        height: 1.4),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      'R\$',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontFamily: 'Lato',
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      NumberFormat.currency(locale: 'pt_BR', symbol: '')
                          .format(price),
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontFamily: 'Lato',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                if (oldPrice != null)
                  Column(
                    children: <Widget>[
                      SizedBox(height: 3),
                      Text(
                        NumberFormat.simpleCurrency(locale: 'pt_BR')
                            .format(oldPrice),
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          decoration: TextDecoration.lineThrough,
                          fontFamily: 'Lato',
                          fontSize: 11,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
