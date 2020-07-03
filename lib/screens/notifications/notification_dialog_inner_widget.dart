import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kwik_client_flutter/screen_arguments/order_arguments.dart';
import 'package:kwik_client_flutter/shared/enums.dart';
import 'package:kwik_client_flutter/utils/theme_utils.dart';
import 'package:kwik_client_flutter/widgets/custom_button_widget.dart';

class NotificationDialogInnerWidget extends StatelessWidget {
  final String id;
  final DateTime createdAt;
  final String title;
  final String description;
  final String logo;
  final bool isNegative;
  final bool isRead;
  final NotificationType notificationType;

  const NotificationDialogInnerWidget({
    Key key,
    @required this.id,
    @required this.createdAt,
    @required this.title,
    @required this.description,
    @required this.isNegative,
    @required this.isRead,
    @required this.notificationType,
    @required this.logo,
  }) : super(key: key);

  String _getButtonText(bool isNegative, NotificationType notificationType) {
    switch (notificationType) {
      case NotificationType.RATING_REQUEST:
        return 'Avaliar o Local';
        break;
      case NotificationType.CONFIRMED_ORDER:
      case NotificationType.READY_FOR_PICKUP:
      case NotificationType.IN_DELIVERY:
        return 'Ir Para Pedido';
        break;
      default:
        return 'OK';
    }
  }

  @override
  Widget build(BuildContext context) {
    var isDark = ThemeUtils.isDark(context);

    bool _hasCloseButton(NotificationType notificationType) {
      switch (notificationType) {
        case NotificationType.RATING_REQUEST:
        case NotificationType.CONFIRMED_ORDER:
        case NotificationType.READY_FOR_PICKUP:
        case NotificationType.IN_DELIVERY:
          return true;
          break;
        default:
          return false;
      }
    }

    void _buttonAction(
        NotificationType notificationType, String id, String logo) {
      switch (notificationType) {
        case NotificationType.RATING_REQUEST:
          Navigator.pop(context);
          Navigator.pushNamed(context, '/rating');
          break;
        case NotificationType.CONFIRMED_ORDER:
        case NotificationType.READY_FOR_PICKUP:
        case NotificationType.IN_DELIVERY:
          Navigator.pop(context);
          Navigator.pushNamed(context, '/order-details',
              arguments: OrderArguments(
                id: id,
                logo: logo,
              ));
          break;
        default:
          Navigator.pop(context);
          break;
      }
    }

    return Container(
      height: _hasCloseButton(notificationType) ? 236 : 175,
      child: Column(
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Lato',
              fontWeight: FontWeight.bold,
              color: isNegative
                  ? isDark ? Color(0xFFDC2F69) : Color(0xFFEE6352)
                  : Theme.of(context).primaryColor,
            ),
          ),
          SizedBox(height: 10),
          SingleChildScrollView(
            child: Container(
              height: 60,
              child: Center(
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.normal,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 12,
            child: Center(
              child: Text(
                DateFormat('dd/MM/yyyy HH:mm').format(createdAt),
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.normal,
                  color: Theme.of(context).disabledColor,
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          CustomButtonWidget(
              buttonText: _getButtonText(isNegative, notificationType),
              onPressed: () => _buttonAction(notificationType, id, logo)),
          if (_hasCloseButton(notificationType))
            Column(
              children: <Widget>[
                SizedBox(height: 16),
                CustomButtonWidget(
                    buttonFillType: ButtonFillType.BORDER,
                    buttonType: ButtonType.DISABLED,
                    buttonText: 'Fechar',
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ],
            ),
        ],
      ),
    );
  }
}
