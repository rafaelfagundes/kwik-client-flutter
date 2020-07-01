import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/utils/theme_utils.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String helperText;
  final Function onChanged;
  final TextInputAction textInputAction;
  final Function onEditingComplete;

  const CustomTextField({
    Key key,
    this.labelText,
    this.helperText,
    this.onChanged,
    this.textInputAction = TextInputAction.done,
    this.onEditingComplete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = ThemeUtils.isDark(context);
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              blurRadius: 8,
              offset: Offset(0, 4),
              color: Colors.black.withOpacity(0.05))
        ],
      ),
      child: TextField(
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
        textInputAction: textInputAction,
        autocorrect: true,
        textCapitalization: TextCapitalization.sentences,
        keyboardType: TextInputType.text,
        style: TextStyle(fontFamily: 'Lato'),
        decoration: InputDecoration(
          filled: true,
          fillColor: isDark ? Color(0xff232323) : Colors.white,
          border: UnderlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(8))),
          labelText: labelText,
          helperText: helperText,
          helperStyle: TextStyle(
            color: Theme.of(context).primaryColor,
            fontFamily: 'Lato',
            fontSize: 11,
          ),
        ),
      ),
    );
  }
}
