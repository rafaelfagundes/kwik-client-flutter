import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kwik_client_flutter/screen_arguments/order_arguments.dart';
import 'package:kwik_client_flutter/utils/date_utils.dart';
import 'package:kwik_client_flutter/widgets/default_screen_widget.dart';
import 'package:kwik_client_flutter/widgets/rounded_store_logo_widget.dart';

import './order_status_widget.dart';
import 'list_item_widget.dart';

class OrderDetailsScreen extends StatelessWidget {
  final String id;
  final String title;
  final String orderValue;
  final DateTime createdAt;

  const OrderDetailsScreen(
      {Key key, this.id, this.title, this.orderValue, this.createdAt})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).brightness.toString() == "Brightness.dark";

    final OrderArguments args = ModalRoute.of(context).settings.arguments;
    print(args.id);

    return DefaultScreen(
      'Detalhes do Pedido',
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
          padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
          width: double.infinity,
          height: 160.0,
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            DateUtils.verboseDate(DateTime.now())
                                    .toUpperCase() +
                                ' | ',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 9,
                              color: const Color(0xffa8a8a8),
                              letterSpacing: 0.0022500000000000003,
                              fontWeight: FontWeight.w900,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            '#GY82FG734A',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 9,
                              color: Theme.of(context).primaryColor,
                              letterSpacing: 0.0022500000000000003,
                              fontWeight: FontWeight.w900,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        'McDonald\'s',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 18,
                          color: Theme.of(context).primaryColor,
                          letterSpacing: 0.0045000000000000005,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$')
                            .format(48.9),
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 13,
                          color: isDark ? Color(0xffA1E8AF) : Color(0xff6BC273),
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  RoundedStoreLogoWidget(
                    size: 64,
                    url: args.logo,
                    animationDuration: 100,
                    heroId: args.id,
                  )
                ],
              ),
              SizedBox(height: 25),
              OrderStatusWidget(),
            ],
          ),
        ),
        SizedBox(height: 20),
        Container(
          margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
          padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
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
              ListItemWidget(qty: 2, title: 'Big Mac', value: 40.00),
              ListItemWidget(qty: 1, title: 'Coca-Cola', value: 2.90),
              ListItemWidget(
                  qty: 1, title: 'Água Mineral com Gás', value: 1.00),
              ListItemWidget(
                title: 'Taxa de Entrega',
                value: 5.00,
                bottomMargin: false,
              ),
              Divider(),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('TOTAL',
                      style: TextStyle(
                          fontFamily: 'Lato',
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 14)),
                  Text(
                      NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$')
                          .format(48.9),
                      style: TextStyle(
                          fontFamily: 'Lato',
                          color: isDark ? Color(0xFFA1E8AF) : Color(0xFF6BC273),
                          fontWeight: FontWeight.w700,
                          fontSize: 18)),
                ],
              ),
              SizedBox(height: 10)
            ],
          ),
        )
      ],
    );
  }
}
