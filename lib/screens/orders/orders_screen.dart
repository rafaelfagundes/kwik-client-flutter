import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/shared/enums.dart';
import 'package:kwik_client_flutter/utils/image_utils.dart';
import 'package:kwik_client_flutter/widgets/default_screen_widget.dart';

import './order_item_widget.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var items = [
      OrderItem(
        ValueKey('b1aa37b9-4499-4b6d-ba3d-232181f3344f'),
        id: 'b1aa37b9-4499-4b6d-ba3d-232181f3344f',
        title: 'McDonald\'s',
        description: '2x Big Mac, 2x Coca-Cola 600ml',
        status: OrderStatusType.OPEN,
        createdAt: new DateTime(2020, 06, 04, 20, 01, 00),
        logo: ImageUtils.resizeCloudinaryImageFromUrl(
          'https://res.cloudinary.com/kardappio/image/upload/v1590475069/hzy36cj4phbearm7wwrc.png',
          64,
          context,
        ),
      ),
      OrderItem(
        ValueKey('2d5a0356-d783-4f20-b889-e7d247781094'),
        id: '2d5a0356-d783-4f20-b889-e7d247781094',
        title: 'McDonald\'s',
        description: '2x Big Mac, 2x Coca-Cola 600ml',
        status: OrderStatusType.OPEN,
        createdAt: new DateTime(2020, 06, 04, 20, 01, 00),
        logo: ImageUtils.resizeCloudinaryImageFromUrl(
          'https://res.cloudinary.com/kardappio/image/upload/v1590475069/hzy36cj4phbearm7wwrc.png',
          64,
          context,
        ),
      ),
      OrderItem(
        ValueKey('9848a550-4f80-473e-823b-fbdd9d7a228f'),
        id: '9848a550-4f80-473e-823b-fbdd9d7a228f',
        title: 'Maria Fumaça Lanches',
        description: '2x Hot-Dog, 1x Sorvete de Baunilha',
        status: OrderStatusType.OPEN,
        createdAt: new DateTime(2020, 06, 12, 20, 01, 00),
        logo: ImageUtils.resizeCloudinaryImageFromUrl(
          'https://res.cloudinary.com/kardappio/image/upload/v1588896819/qw8zawqs1j1al7geejd8.png',
          64,
          context,
        ),
      ),
    ];

    return DefaultScreen(
      'Pedidos',
      children: <Widget>[...items],
    );
  }
}
