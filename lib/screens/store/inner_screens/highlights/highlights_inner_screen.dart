import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:kwik_client_flutter/widgets/product_item_widget.dart';

import 'highlights_title_widget.dart';

class HighlightsInner extends StatelessWidget {
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
                ProductItemWidget(),
                ProductItemWidget(),
                ProductItemWidget(),
                ProductItemWidget(),
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
                ProductItemWidget(),
                ProductItemWidget(),
                ProductItemWidget(),
                ProductItemWidget(),
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
                ProductItemWidget(),
                ProductItemWidget(),
                ProductItemWidget(),
                ProductItemWidget(),
              ],
            ),
          ),
          SizedBox(height: 72)
        ],
      ),
    );
  }
}
