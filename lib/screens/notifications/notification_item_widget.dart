import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/shared/enums.dart';
import 'package:kwik_client_flutter/utils/date_utils.dart';
import 'package:kwik_client_flutter/utils/theme_utils.dart';
import 'package:kwik_client_flutter/widgets/rounded_store_logo_widget.dart';

import 'notification_dialog_inner_widget.dart';

class NotificationItem extends StatelessWidget {
  final String id;
  final DateTime createdAt;
  final String title;
  final String description;
  final String logo;
  final bool isNegative;
  final bool isRead;
  final NotificationType notificationType;

  NotificationItem(
    Key key, {
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.createdAt,
    @required this.isRead,
    @required this.notificationType,
    @required this.logo,
    this.isNegative = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = ThemeUtils.isDark(context);

    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: isDark ? Color(0xFF232323) : Color(0xFFFFFFFF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(16.0),
              ),
            ),
            content: NotificationDialogInnerWidget(
              id: id,
              title: title,
              description: description,
              createdAt: createdAt,
              isRead: isRead,
              notificationType: notificationType,
              isNegative: isNegative,
              logo: logo,
            ),
          );
        },
      );
    }

    return GestureDetector(
      onTap: () {
        _showMyDialog();
      },
      onHorizontalDragStart: (details) => print(details),
      onHorizontalDragEnd: (details) => print(details),
      child: Container(
        margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
        padding: EdgeInsets.only(top: 8, bottom: 14, left: 16, right: 16),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: Theme.of(context).cardColor.withOpacity(isRead ? 0.5 : 1),
          boxShadow: [
            BoxShadow(
              color: const Color(0x0d000000),
              offset: Offset(0, 4),
              blurRadius: 16,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    DateUtils.verboseDate(createdAt).toUpperCase(),
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 9,
                      color: const Color(0xffa8a8a8),
                      letterSpacing: 0.0022500000000000003,
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 18,
                      color: isNegative
                          ? Theme.of(context).errorColor
                          : Theme.of(context).primaryColor,
                      letterSpacing: 0.0045000000000000005,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 13,
                      color: const Color(0xff7b7b7b),
                      letterSpacing: 0.0032500000000000003,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            RoundedStoreLogoWidget(
              size: 64,
              url: logo,
              animationDuration: 100,
              heroId: id,
            )
          ],
        ),
      ),
    );
  }
}
