import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:kwik_client_flutter/widgets/product_item_widget.dart';

class HighlightsInner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(height: 10),
          HighlightsTitle(
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
          HighlightsTitle(
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
          HighlightsTitle(
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
          SizedBox(height: 36)
        ],
      ),
    );
  }
}

class HighlightsTitle extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconColor;
  final Color color;

  const HighlightsTitle({
    Key key,
    this.title,
    this.icon,
    this.iconColor,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: <Widget>[
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.all(Radius.circular(4))),
            child: Center(
                child: Icon(
              icon,
              color: iconColor,
              size: 12,
            )),
          ),
          SizedBox(width: 5),
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
