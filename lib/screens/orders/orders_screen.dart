import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/screens/orders/order_status_widget.dart';
import 'package:kwik_client_flutter/widgets/default_screen_widget.dart';
import 'package:kwik_client_flutter/widgets/order_item_widget.dart';

class Orders extends StatelessWidget {
  final items = [
    OrderItem(
      ValueKey('#908YH99H'),
      title: 'McDonald\'s',
      description: '2x Big Mac, 2x Coca-Cola 600ml',
      status: OrderStatusType.OPEN,
      createdAt: new DateTime(2020, 06, 04, 20, 01, 00),
    ),
    OrderItem(
      ValueKey('#908YHG99H'),
      title: 'Carvalho, Souza and Santos',
      description: '2x Big Mac, 2x Coca-Cola 600ml',
      status: OrderStatusType.CONFIRMED,
      createdAt: new DateTime(2020, 06, 03, 20, 01, 00),
    ),
    OrderItem(
      ValueKey('#908HYH99H'),
      title: 'McDonald\'s',
      description: '2x Big Mac, 2x Coca-Cola 600ml',
      status: OrderStatusType.ON_DELIVERY,
      createdAt: new DateTime(2020, 05, 15, 20, 01, 00),
    ),
    OrderItem(
      ValueKey('#908YGFH99H'),
      title: 'McDonald\'s',
      description: '2x Big Mac, 2x Coca-Cola 600ml',
      status: OrderStatusType.READY_FOR_PICKUP,
      createdAt: new DateTime(2019, 05, 30, 20, 01, 00),
    ),
    OrderItem(
      ValueKey('#908JHYH99H'),
      title: 'McDonald\'s',
      description: '2x Big Mac, 2x Coca-Cola 600ml',
      status: OrderStatusType.CANCELED_BY_USER,
      createdAt: new DateTime(2020, 05, 30, 20, 01, 00),
    ),
    OrderItem(
      ValueKey('#908YEH99H'),
      title: 'McDonald\'s',
      description: '2x Big Mac, 2x Coca-Cola 600ml',
      status: OrderStatusType.CANCELED_BY_STORE,
      createdAt: new DateTime(2020, 05, 30, 20, 01, 00),
    ),
    OrderItem(
      ValueKey('#908YFSH99H'),
      title: 'McDonald\'s',
      description: '2x Big Mac, 2x Coca-Cola 600ml',
      status: OrderStatusType.EXPIRED,
      createdAt: new DateTime(2020, 05, 30, 20, 01, 00),
    ),
    OrderItem(
      ValueKey('#908GFHYH99H'),
      title: 'McDonald\'s',
      description: '2x Big Mac, 2x Coca-Cola 600ml',
      status: OrderStatusType.DELIVERED,
      createdAt: new DateTime(2020, 05, 30, 20, 01, 00),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultScreen(
      'Pedidos',
      children: <Widget>[...items],
    );
  }
}
