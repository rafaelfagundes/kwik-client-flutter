import 'package:flutter/material.dart';

class ConfirmationButton extends StatelessWidget {
  final String buttonText;
  final Function onPressed;

  const ConfirmationButton({Key key, this.buttonText, this.onPressed})
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
      child: Text(
        buttonText,
        style: TextStyle(
            fontFamily: 'Lato',
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.white),
      ),
    );
  }
}