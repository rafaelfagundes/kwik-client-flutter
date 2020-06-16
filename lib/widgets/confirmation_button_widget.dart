import 'package:flutter/material.dart';

class ConfirmationButton extends StatelessWidget {
  final String buttonText;
  final Icon icon;
  final Function onPressed;

  const ConfirmationButton(
      {Key key, this.buttonText, this.onPressed, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).brightness.toString() == "Brightness.dark";
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 0,
      fillColor: isDark ? Color(0xff79C881) : Color(0xff6BC273),
      splashColor: Color(0xff000000),
      constraints: BoxConstraints(minHeight: 44),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (icon != null) icon,
          if (icon != null) SizedBox(width: 10),
          Text(
            buttonText,
            style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.white),
          ),
        ],
      ),
    );
  }
}
