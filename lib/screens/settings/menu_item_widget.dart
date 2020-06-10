import 'package:flutter/material.dart';

class MenuItemWidget extends StatelessWidget {
  final String title;
  final String route;
  final IconData icon;
  final int badgeCount;

  const MenuItemWidget(
      {Key key,
      @required this.title,
      @required this.route,
      @required this.icon,
      this.badgeCount = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(horizontal: 16),
        height: 50,
        child: Row(
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(icon, size: 28, color: Theme.of(context).primaryColor),
                SizedBox(
                  width: 5,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 16,
                    color: Theme.of(context).primaryColor,
                    letterSpacing: 0.004,
                  ),
                  textAlign: TextAlign.left,
                )
              ],
            ),
            badgeCount == 0
                ? SizedBox()
                : Container(
                    margin: EdgeInsets.only(left: 5),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                    child: Text(
                      '8',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 12),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(24.0, 24.0)),
                        border: Border.all(color: Colors.white, width: 1)),
                  )
          ],
        ),
      ),
    );
  }
}