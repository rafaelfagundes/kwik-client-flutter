import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kwik_client_flutter/screen_arguments/product_arguments.dart';
import 'package:kwik_client_flutter/shared/enums.dart';

import 'discount_badge_widget.dart';

class ProductItemWidget extends StatelessWidget {
  final String id;
  final String heroId;
  final String title;
  final bool hasDiscount;
  final double discountValue;
  final double value;
  final double oldValue;
  final String logo;
  final String banner;
  final DiscountType discountType;

  const ProductItemWidget({
    Key key,
    @required this.id,
    @required this.heroId,
    @required this.logo,
    @required this.banner,
    @required this.title,
    @required this.hasDiscount,
    @required this.discountValue,
    @required this.discountType,
    @required this.value,
    @required this.oldValue,
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
            heroId: heroId,
            logo: logo,
            banner: banner,
            hasDiscount: hasDiscount,
            discountType: discountType,
            discountValue: discountValue,
            oldValue: oldValue,
            title: title,
            value: value,
          ),
        );
      },
      child: Container(
        width: 190,
        height: 140,
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Hero(
              tag: heroId,
              child: Container(
                width: 190,
                height: 140,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(banner),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
              ),
            ),
            if (hasDiscount)
              Positioned(
                top: 16,
                right: -6,
                child: DiscountBadgeWidget(
                  discountValue: discountValue,
                  discountType: discountType,
                ),
              ),
            Positioned(
              top: 80,
              height: 60,
              width: 190,
              child: Container(
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black,
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 99,
              left: 12,
              width: 190,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Lato',
                      fontSize: 14,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'R\$',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Lato',
                          fontSize: 10,
                        ),
                      ),
                      Text(
                        NumberFormat.currency(locale: 'pt_BR', symbol: '')
                            .format(value),
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Lato',
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 3),
                      Text(
                        NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$')
                            .format(oldValue),
                        style: TextStyle(
                          color: Color(0xffDDD5D5),
                          fontFamily: 'Lato',
                          fontSize: 10,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
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
