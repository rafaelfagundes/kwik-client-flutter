import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/utils/theme_utils.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String complementaryTitle;
  final Function onPressed;
  final String buttonText;

  const SectionTitle(
    this.title, {
    Key key,
    this.complementaryTitle,
    this.onPressed,
    this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = ThemeUtils.isDark(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          title.toUpperCase(),
          style: TextStyle(
            fontFamily: 'Lato',
            fontSize: 13,
            fontWeight: FontWeight.w900,
            color: isDark ? Color(0xffB0B0B0) : Color(0xff7B7B7B),
          ),
        ),
        if (complementaryTitle != null)
          Text(
            complementaryTitle,
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 11,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).primaryColor,
            ),
          ),
        if (onPressed != null)
          GestureDetector(
            child: Container(
              child: Text(buttonText.toUpperCase(),
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: isDark ? Color(0xFFED7B84) : Color(0xFF6B3D92),
                  )),
            ),
          ),
      ],
    );
  }
}
