import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/shared/enums.dart';
import 'package:kwik_client_flutter/widgets/default_screen_widget.dart';

import './notification_item_widget.dart';

class NotificationsScreen extends StatelessWidget {
  final items = [
    NotificationItem(new ValueKey('b1aa37b9-4499-4b6d-ba3d-232181f3344f'),
        id: 'b1aa37b9-4499-4b6d-ba3d-232181f3344f',
        title: 'Pedido Cancelado',
        description: '2x Big Mac, 2x Coca-Cola 600ml',
        createdAt: new DateTime(2020, 05, 30, 20, 15, 00),
        isRead: false,
        isNegative: true,
        notificationType: NotificationType.ORDER_CANCELED_BY_STORE,
        logo:
            'https://res.cloudinary.com/kardappio/image/upload/v1590475069/hzy36cj4phbearm7wwrc.png'),
    NotificationItem(new ValueKey('2d5a0356-d783-4f20-b889-e7d247781094'),
        id: '2d5a0356-d783-4f20-b889-e7d247781094',
        title: 'Pedido Confirmado',
        description: '2x Big Mac, 2x Coca-Cola 600ml',
        createdAt: new DateTime(2020, 05, 30, 20, 01, 00),
        isRead: false,
        notificationType: NotificationType.CONFIRMED_ORDER,
        logo:
            'https://res.cloudinary.com/kardappio/image/upload/v1590475069/hzy36cj4phbearm7wwrc.png'),
    NotificationItem(new ValueKey('9848a550-4f80-473e-823b-fbdd9d7a228f'),
        id: '9848a550-4f80-473e-823b-fbdd9d7a228f',
        title: 'Diga o Que Você Achou',
        description: 'Conte para todos como foi o pedido em McDonald\'s',
        createdAt: new DateTime(2020, 05, 30, 20, 01, 00),
        isRead: false,
        notificationType: NotificationType.RATING_REQUEST,
        logo:
            'https://res.cloudinary.com/kardappio/image/upload/v1590475069/hzy36cj4phbearm7wwrc.png'),
    NotificationItem(new ValueKey('13e05d4c-34b2-4b8f-bb6e-9e97601083ab'),
        id: '13e05d4c-34b2-4b8f-bb6e-9e97601083ab',
        title: 'Pedido Cancelado',
        description: '2x Big Mac, 2x Coca-Cola 600ml',
        createdAt: new DateTime(2020, 05, 30, 20, 01, 00),
        isRead: true,
        isNegative: true,
        notificationType: NotificationType.ORDER_CANCELED_BY_STORE,
        logo:
            'https://res.cloudinary.com/kardappio/image/upload/v1590475069/hzy36cj4phbearm7wwrc.png'),
    NotificationItem(new ValueKey('59fdb571-eafa-49c6-aabb-21bad968a18b'),
        id: '59fdb571-eafa-49c6-aabb-21bad968a18b',
        title: 'Pedido Cancelado',
        description: '2x Big Mac, 2x Coca-Cola 600ml',
        createdAt: new DateTime(2020, 05, 30, 20, 01, 00),
        isRead: false,
        isNegative: true,
        notificationType: NotificationType.ORDER_CANCELED_BY_STORE,
        logo:
            'https://res.cloudinary.com/kardappio/image/upload/v1590475069/hzy36cj4phbearm7wwrc.png'),
    NotificationItem(new ValueKey('b70c4659-ab76-4305-8015-f4d8df0729a2'),
        id: 'b70c4659-ab76-4305-8015-f4d8df0729a2',
        title: 'Pedido Confirmado',
        description: '2x Big Mac, 2x Coca-Cola 600ml',
        createdAt: new DateTime(2020, 05, 30, 20, 01, 00),
        isRead: true,
        notificationType: NotificationType.CONFIRMED_ORDER,
        logo:
            'https://res.cloudinary.com/kardappio/image/upload/v1590475069/hzy36cj4phbearm7wwrc.png'),
    NotificationItem(new ValueKey('bf15bcbc-cd6a-4aca-a1e0-9b73bee2cf14'),
        id: 'bf15bcbc-cd6a-4aca-a1e0-9b73bee2cf14',
        title: 'Pedido Confirmado',
        description: '2x Big Mac, 2x Coca-Cola 600ml',
        createdAt: new DateTime(2020, 05, 30, 20, 01, 00),
        isRead: true,
        notificationType: NotificationType.CONFIRMED_ORDER,
        logo:
            'https://res.cloudinary.com/kardappio/image/upload/v1590475069/hzy36cj4phbearm7wwrc.png'),
  ];

  NotificationsScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScreen(
      'Notificações',
      children: <Widget>[...items],
    );
  }
}
