import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';

class AddButton extends StatelessWidget {
  final String buttonText;
  final Function onPressed;

  const AddButton({Key key, this.buttonText, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).brightness.toString() == "Brightness.dark";

    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 0,
      // fillColor: Color(0xffA1E8AF),
      splashColor: isDark ? Color(0xff6BC273) : Color(0xffA1E8AF),
      constraints: BoxConstraints(minHeight: 44),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(SFSymbols.plus_circle,
              color: isDark ? Color(0xffA1E8AF) : Color(0xff6BC273)),
          SizedBox(width: 5),
          Text(
            buttonText,
            style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: isDark ? Color(0xffA1E8AF) : Color(0xff6BC273)),
          ),
        ],
      ),
    );
  }
}
