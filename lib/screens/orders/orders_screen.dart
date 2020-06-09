import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/screens/orders/order_status_widget.dart';
import 'package:kwik_client_flutter/widgets/default_screen_widget.dart';

import './order_item_widget.dart';

class Orders extends StatelessWidget {
  final items = [
    OrderItem(
      ValueKey('20d31457-e9d2-413b-8f52-819c82444808'),
      id: '20d31457-e9d2-413b-8f52-819c82444808',
      title: 'McDonald\'s',
      description: '2x Big Mac, 2x Coca-Cola 600ml',
      status: OrderStatusType.OPEN,
      createdAt: new DateTime(2020, 06, 04, 20, 01, 00),
    ),
    OrderItem(
      ValueKey('4c0d872a-19f8-4854-8c31-1d595a4e9912'),
      id: '4c0d872a-19f8-4854-8c31-1d595a4e9912',
      title: 'Carvalho, Souza and Santos',
      description: '2x Big Mac, 2x Coca-Cola 600ml',
      status: OrderStatusType.CONFIRMED,
      createdAt: new DateTime(2020, 06, 03, 20, 01, 00),
    ),
    OrderItem(
      ValueKey('4840c55c-eed8-4a2d-ae26-607f05a6c683'),
      id: '4840c55c-eed8-4a2d-ae26-607f05a6c683',
      title: 'McDonald\'s',
      description: '2x Big Mac, 2x Coca-Cola 600ml',
      status: OrderStatusType.ON_DELIVERY,
      createdAt: new DateTime(2020, 05, 15, 20, 01, 00),
    ),
    OrderItem(
      ValueKey('478f58e9-a034-4092-b3a6-ad3b96393daf'),
      id: '478f58e9-a034-4092-b3a6-ad3b96393daf',
      title: 'McDonald\'s',
      description: '2x Big Mac, 2x Coca-Cola 600ml',
      status: OrderStatusType.READY_FOR_PICKUP,
      createdAt: new DateTime(2019, 05, 30, 20, 01, 00),
    ),
    OrderItem(
      ValueKey('374e882d-93c3-46a5-a1fd-315f2f209439'),
      id: '374e882d-93c3-46a5-a1fd-315f2f209439',
      title: 'McDonald\'s',
      description: '2x Big Mac, 2x Coca-Cola 600ml',
      status: OrderStatusType.CANCELED_BY_USER,
      createdAt: new DateTime(2020, 05, 30, 20, 01, 00),
    ),
    OrderItem(
      ValueKey('ed99c1df-f216-4d8a-bc1e-b8683bab1d33'),
      id: 'ed99c1df-f216-4d8a-bc1e-b8683bab1d33',
      title: 'McDonald\'s',
      description: '2x Big Mac, 2x Coca-Cola 600ml',
      status: OrderStatusType.CANCELED_BY_STORE,
      createdAt: new DateTime(2020, 05, 30, 20, 01, 00),
    ),
    OrderItem(
      ValueKey('70c07e0a-0478-4283-9656-62980be73118'),
      id: '70c07e0a-0478-4283-9656-62980be73118',
      title: 'McDonald\'s',
      description: '2x Big Mac, 2x Coca-Cola 600ml',
      status: OrderStatusType.EXPIRED,
      createdAt: new DateTime(2020, 05, 30, 20, 01, 00),
    ),
    OrderItem(
      ValueKey('3c113d88-7285-4a35-9f74-c842ca486df5'),
      id: '3c113d88-7285-4a35-9f74-c842ca486df5',
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
