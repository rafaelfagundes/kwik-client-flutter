import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/utils/theme_utils.dart';

class IntegerQtyWidget extends StatelessWidget {
  final int value;
  final double size;
  final int min;
  final int max;
  final Function onChange;

  IntegerQtyWidget(
      {Key key,
      @required this.value,
      @required this.onChange,
      this.size = 28,
      this.min = 0,
      this.max = 99})
      : super(key: key);

  void _add() {
    int newValue = value + 1;
    if (newValue <= max) {
      onChange(newValue);
    }
  }

  void _subtract() {
    int newValue = value - 1;
    if (newValue >= min) {
      onChange(newValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    var isDark = ThemeUtils.isDark(context);

    return Container(
      width: size * 3 + 10,
      height: size,
      decoration: BoxDecoration(
          color: isDark ? Color(0xff373737) : Color(0xFFF5F5F5),
          borderRadius: BorderRadius.all(Radius.circular(4))),
      child: Row(
        children: <Widget>[
          Button(
              size: size,
              add: false,
              onChange: _subtract,
              value: value,
              isDark: isDark),
          Container(
            width: size + 10,
            child: Center(
              child: Text(
                value.toString(),
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: size * 0.5,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
          Button(
              size: size,
              add: true,
              onChange: _add,
              value: value,
              isDark: isDark),
        ],
      ),
    );
  }
}

class Button extends StatelessWidget {
  Button(
      {Key key,
      @required this.size,
      this.add = true,
      @required this.value,
      @required this.onChange,
      @required this.isDark})
      : super(key: key);

  final double size;
  final bool add;
  final bool isDark;
  final int value;
  final Function onChange;

  Color _getColor(bool add, bool isDark) {
    if (isDark) {
      if (add) {
        return Color(0xff6BC273);
      } else {
        return Color(0xffEF5D60);
      }
    } else {
      if (add) {
        return Color(0xffA1E8AF);
      } else {
        return Color(0xffFCBCB8);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChange,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: _getColor(add, isDark),
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        child: Center(
            child: Text(add ? '+' : '-',
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w900,
                    fontSize: size * 0.57))),
      ),
    );
  }
}
