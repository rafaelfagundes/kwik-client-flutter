import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:kwik_client_flutter/shared/enums.dart';
import 'package:kwik_client_flutter/widgets/product_item_widget.dart';

import 'highlights_title_widget.dart';

class HighlightsInner extends StatelessWidget {
  final String logo;

  const HighlightsInner({Key key, this.logo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(height: 10),
          HighlightsTitleWidget(
            title: 'Promoções',
            icon: SFSymbols.percent,
            iconColor: Color(0xffFFFFFF),
            color: Color(0xFFEF5D60),
          ),
          SizedBox(height: 10),
          Container(
            height: 140,
            child: ListView(
              padding: EdgeInsets.only(left: 24),
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                ProductItemWidget(
                  id: '3ebb510a-2305-4ecf-b158-c2e718481822',
                  heroId: '3ebb510a-2305-4ecf-b158-c2e718481822_promocoes',
                  title: 'Cheeseburger',
                  banner:
                      'https://res.cloudinary.com/kardappio/image/upload/v1588019524/ixc1s8t8wxcbce3tudvf.jpg',
                  logo: logo,
                  discountType: DiscountType.PERCENTAGE,
                  discountValue: 7,
                  hasDiscount: false,
                  oldValue: 23.99,
                  value: 17.4,
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          HighlightsTitleWidget(
            title: 'Recomendado',
            icon: SFSymbols.star_fill,
            iconColor: Theme.of(context).cardColor,
            color: Color(0xffFFC233),
          ),
          SizedBox(height: 10),
          Container(
            height: 140,
            child: ListView(
              padding: EdgeInsets.only(left: 24),
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                // ProductItemWidget(),
                ProductItemWidget(
                  id: '3ebb510a-2305-4ecf-b158-c2e718481822',
                  heroId: '3ebb510a-2305-4ecf-b158-c2e718481822_recomendado',
                  title: 'Cheeseburger',
                  banner:
                      'https://res.cloudinary.com/kardappio/image/upload/v1588019524/ixc1s8t8wxcbce3tudvf.jpg',
                  logo: logo,
                  discountType: DiscountType.PERCENTAGE,
                  discountValue: 7,
                  hasDiscount: false,
                  oldValue: 23.99,
                  value: 17.4,
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          HighlightsTitleWidget(
            title: 'Mais Vendidos',
            icon: SFSymbols.money_dollar,
            iconColor: Theme.of(context).cardColor,
            color: Color(0xff6BC273),
          ),
          SizedBox(height: 10),
          Container(
            height: 140,
            child: ListView(
              padding: EdgeInsets.only(left: 24),
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                ProductItemWidget(
                  id: '3ebb510a-2305-4ecf-b158-c2e718481822',
                  heroId: '3ebb510a-2305-4ecf-b158-c2e718481822_+vendidos',
                  title: 'Cheeseburger',
                  banner:
                      'https://res.cloudinary.com/kardappio/image/upload/v1588019524/ixc1s8t8wxcbce3tudvf.jpg',
                  logo: logo,
                  discountType: DiscountType.PERCENTAGE,
                  discountValue: 7,
                  hasDiscount: false,
                  oldValue: 23.99,
                  value: 17.4,
                )
              ],
            ),
          ),
          SizedBox(height: 72)
        ],
      ),
    );
  }
}
