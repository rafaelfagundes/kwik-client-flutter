import 'package:flutter/material.dart';

class AddressItemWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String city;
  final bool isDefault;

  const AddressItemWidget(
      {Key key,
      @required this.title,
      @required this.subtitle,
      @required this.city,
      @required this.isDefault})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).brightness.toString() == "Brightness.dark";

    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
      padding: EdgeInsets.only(top: 14, bottom: 8, left: 16, right: 16),
      width: double.infinity,
      height: isDefault ? 108.0 : 120.0,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          isDefault
              ? Text('PRINCIPAL',
                  style: TextStyle(
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w900,
                      fontSize: 9,
                      color: isDark ? Color(0xFFED7B84) : Color(0xFF854798)))
              : SizedBox(),
          SizedBox(height: 5),
          Text(title,
              maxLines: 1,
              style: TextStyle(
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: Theme.of(context).primaryColor)),
          SizedBox(height: 5),
          Text(subtitle,
              maxLines: 1,
              style: TextStyle(
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: isDark ? Color(0xFFC1C1C1) : Color(0xFF7B7B7B))),
          SizedBox(height: 7),
          Text(city,
              maxLines: 1,
              style: TextStyle(
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                  color: Theme.of(context).primaryColor)),
          SizedBox(height: isDefault ? 0 : 12),
          isDefault
              ? SizedBox()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'REMOVER',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w700,
                          fontSize: 11,
                          color: isDark ? Color(0xFFED7B84) : Color(0xFFDC2F69),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'DEFINIR COMO PRINCIPAL',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w700,
                          fontSize: 11,
                          color: Color(0xFF6BC273),
                        ),
                      ),
                    ),
                  ],
                )
        ],
      ),
    );
  }
}
