import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:kwik_client_flutter/widgets/header_widget.dart';
import 'package:kwik_client_flutter/widgets/notification_item_widget.dart';

class Notifications extends StatelessWidget {
  final items = [
    NotificationItem(
      new ValueKey('TESTE1234'),
      'Pedido Cancelado',
      '2x Big Mac, 2x Coca-Cola 600ml',
      new DateTime(2020, 05, 30, 20, 15, 00),
      false,
      isNegative: true,
    ),
    NotificationItem(
        new ValueKey('TESTEfdsa'),
        'Pedido Confirmado',
        '2x Big Mac, 2x Coca-Cola 600ml',
        new DateTime(2020, 05, 30, 20, 01, 00),
        false),
    NotificationItem(
        new ValueKey('TESTEfdvsa'),
        'Pedido Confirmado',
        '2x Big Mac, 2x Coca-Cola 600ml',
        new DateTime(2020, 05, 30, 20, 01, 00),
        false),
    NotificationItem(
      new ValueKey('TESTEfhgdsa'),
      'Pedido Cancelado',
      '2x Big Mac, 2x Coca-Cola 600ml',
      new DateTime(2020, 05, 30, 20, 01, 00),
      true,
      isNegative: true,
    ),
    NotificationItem(
      new ValueKey('TESTEfgfsdsa'),
      'Pedido Cancelado',
      '2x Big Mac, 2x Coca-Cola 600ml',
      new DateTime(2020, 05, 30, 20, 01, 00),
      false,
      isNegative: true,
    ),
    NotificationItem(
      new ValueKey('TESTEfhddgdsa'),
      'Pedido Confirmado',
      '2x Big Mac, 2x Coca-Cola 600ml',
      new DateTime(2020, 05, 30, 20, 01, 00),
      true,
    ),
    NotificationItem(
      new ValueKey('TESTEfaagfsdsa'),
      'Pedido Confirmado',
      '2x Big Mac, 2x Coca-Cola 600ml',
      new DateTime(2020, 05, 30, 20, 01, 00),
      true,
    ),
    // NotificationItem(),
    // NotificationItem(),
  ];

  Notifications({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Header('Notificações', false, true, null,
                SFSymbols.slider_horizontal_3),
            Flexible(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return items[index];
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
