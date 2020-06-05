import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String helperText;
  final Function onChanged;

  const CustomTextField(
      {Key key, this.labelText, this.helperText, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).brightness.toString() == "Brightness.dark";
    return TextField(
      onChanged: onChanged,
      autocorrect: true,
      textCapitalization: TextCapitalization.words,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        filled: true,
        fillColor: isDark ? Color(0xff232323) : Colors.white,
        border: isDark
            ? UnderlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(8)))
            : OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
        labelText: labelText,
        helperText: helperText,
      ),
    );
  }
}
