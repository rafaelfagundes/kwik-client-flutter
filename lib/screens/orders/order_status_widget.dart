import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/shared/enums.dart';

class StatusType {
  final String statusText;
  final Color statusColor;

  StatusType(this.statusText, this.statusColor);
}

class OrderStatusWidget extends StatelessWidget {
  final OrderStatusType type;

  OrderStatusWidget(this.type);

  StatusType getStatus(OrderStatusType type) {
    switch (type) {
      case (OrderStatusType.OPEN):
        return new StatusType('ABERTO', Colors.blue[600]);
        break;
      case (OrderStatusType.CONFIRMED):
        return new StatusType('CONFIRMADO', Colors.green);
        break;
      case (OrderStatusType.ON_DELIVERY):
        return new StatusType('ENTREGANDO', Colors.purple);
        break;
      case (OrderStatusType.READY_FOR_PICKUP):
        return new StatusType('PRONTO P/ RETIRADA', Colors.deepPurple);
        break;
      case (OrderStatusType.CANCELED_BY_USER):
        return new StatusType('VOCÊ CANCELOU', Colors.red);
        break;
      case (OrderStatusType.CANCELED_BY_STORE):
        return new StatusType('CANCELADO', Colors.red);
        break;
      case (OrderStatusType.EXPIRED):
        return new StatusType('EXPIRADO', Colors.orange);
        break;
      case (OrderStatusType.DELIVERED):
        return new StatusType('ENTREGUE', Colors.blue[300]);
        break;
      default:
        return new StatusType('ABERTO', Colors.blue[600]);
    }
  }

  @override
  Widget build(BuildContext context) {
    var statusType = getStatus(type);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3, vertical: 1),
      decoration: BoxDecoration(
        color: statusType.statusColor,
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Text(
        statusType.statusText,
        style: TextStyle(
            color: Colors.white,
            fontSize: 9,
            fontWeight: FontWeight.w700,
            fontFamily: 'Lato'),
      ),
    );
  }
}
