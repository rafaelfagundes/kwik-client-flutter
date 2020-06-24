import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kwik_client_flutter/screens/cart/value_and_add_footer_widget.dart';
import 'package:kwik_client_flutter/utils/theme_utils.dart';
import 'package:kwik_client_flutter/widgets/default_screen_widget.dart';
import 'package:kwik_client_flutter/widgets/rounded_store_logo_widget.dart';
import 'package:kwik_client_flutter/widgets/section_title_widget.dart';

class CartOrderSummaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var isDark = ThemeUtils.isDark(context);
    var paddingBottom = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          DefaultScreen(
            'Resumo do Pedido',
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                padding:
                    EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: Theme.of(context).cardColor,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0x0d000000),
                      offset: Offset(0, 4),
                      blurRadius: 16,
                    ),
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'McDonald\'s',
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 18,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w700,
                                height: 1,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              NumberFormat.simpleCurrency(locale: 'pt_BR')
                                  .format(61.8),
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 16,
                                color: Color(0xFF6BC273),
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        RoundedStoreLogoWidget(
                          url:
                              'https://res.cloudinary.com/kardappio/image/upload/v1590475069/hzy36cj4phbearm7wwrc.png',
                        )
                      ],
                    ),
                    SizedBox(height: 16),
                    InfoLine(
                        title: 'Tipo de Entrega', info: 'Será entregue à você'),
                    InfoLine(title: 'Forma de Pagamento', info: 'Dinheiro'),
                    InfoLine(
                        title: 'Troco para',
                        info: NumberFormat.simpleCurrency(locale: 'pt_BR')
                            .format(50)),
                    InfoLine(title: 'Cumpom de desconto', info: 'SEUMADRUGA20'),
                    InfoColumn(
                        title: 'Endereço',
                        info: 'Rua Frederico Ozanan, 150 - Guarda-Mor'),
                    InfoColumn(
                        title: 'Observações',
                        info: 'Favor remover o picles e a cebola'),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                padding:
                    EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 16),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: Theme.of(context).cardColor,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0x0d000000),
                      offset: Offset(0, 4),
                      blurRadius: 16,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Itens do Pedido',
                      style: TextStyle(
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    ),
                    SizedBox(height: 10),
                    ItemLine(
                      qty: 2,
                      title: 'Big Mac - Normal',
                      value: 40,
                    ),
                    ItemLine(
                      qty: 1,
                      title: 'Coca-Cola - Lata 500 ml',
                      value: 2.9,
                    ),
                    ItemLine(
                      qty: 1,
                      title: 'Água Mineral com Gás',
                      value: 1,
                    ),
                    ItemLine(
                      qty: 0,
                      title: 'Taxa de Entrega',
                      value: 5,
                    ),
                    ItemLine(
                      qty: 0,
                      title: 'Desconto',
                      value: -5.9,
                    ),
                    SizedBox(height: 5),
                    Divider(),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'TOTAL',
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 12,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          NumberFormat.simpleCurrency(locale: 'pt_BR')
                              .format(61.8),
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xff6BC273),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          Positioned(
            bottom: 0,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 65 + paddingBottom,
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
            value: 61.8,
            valueSize: 16,
            onPressed: () {
              Navigator.pushNamed(context, '/order-success');
            },
            isLastScreen: true,
            bottomPosition: 0,
          ),
        ],
      ),
    );
  }
}

class ItemLine extends StatelessWidget {
  final int qty;
  final String title;
  final double value;

  const ItemLine({
    Key key,
    @required this.qty,
    @required this.title,
    @required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = ThemeUtils.isDark(context);

    return Container(
      height: 42,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              if (qty > 0)
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: isDark ? Color(0xFFED7B84) : Color(0xFF440044),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '${qty}x',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: isDark ? Color(0xFF440044) : Colors.white,
                      ),
                    ),
                  ),
                ),
              if (qty == 0) SizedBox(width: 32),
              SizedBox(width: 10),
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Theme.of(context).primaryColor,
                ),
              )
            ],
          ),
          Text(
            NumberFormat.simpleCurrency(locale: 'pt_BR').format(value),
            style: TextStyle(
                fontFamily: 'Lato',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: value < 0
                    ? isDark ? Color(0xFF72F3EF) : Color(0xFF6B3D92)
                    : Color(0xFF6BC273)),
          )
        ],
      ),
    );
  }
}

class InfoLine extends StatelessWidget {
  final String title;
  final String info;

  const InfoLine({
    Key key,
    @required this.title,
    @required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SectionTitle(title),
          Text(
            info,
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 14,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class InfoColumn extends StatelessWidget {
  final String title;
  final String info;

  const InfoColumn({
    Key key,
    @required this.title,
    @required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SectionTitle(title),
          SizedBox(height: 2),
          Text(
            info,
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 14,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
