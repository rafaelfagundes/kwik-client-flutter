import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/utils/theme_utils.dart';

class SlideSwitchOption {
  final String label;
  final dynamic value;

  SlideSwitchOption({@required this.label, @required this.value});
}

class SlideSwitchWidget extends StatefulWidget {
  final double margin;
  final double size;
  final List<SlideSwitchOption> options;
  final dynamic value;
  final Function onChanged;

  const SlideSwitchWidget({
    Key key,
    this.margin = 16,
    this.size = 44,
    @required this.options,
    @required this.value,
    @required this.onChanged,
  }) : super(key: key);

  @override
  _SlideSwitchWidgetState createState() => _SlideSwitchWidgetState();
}

class _SlideSwitchWidgetState extends State<SlideSwitchWidget> {
  int index = 0;

  void _setIndex(value) {
    widget.onChanged(widget.options[value].value);

    setState(() {
      index = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    var isDark = ThemeUtils.isDark(context);
    var itemWidth = (MediaQuery.of(context).size.width - (widget.margin * 2)) /
        widget.options.length;

    return Stack(
      children: <Widget>[
        Container(
          height: widget.size,
          decoration: BoxDecoration(
              color: isDark ? Color(0xff232323) : Colors.white,
              boxShadow: [
                BoxShadow(
                    blurRadius: 8,
                    offset: Offset(0, 4),
                    color: Colors.black.withOpacity(0.05))
              ],
              borderRadius: BorderRadius.all(Radius.circular(8))),
        ),
        AnimatedPositioned(
          duration: Duration(milliseconds: 225),
          left: index * itemWidth,
          child: Container(
            height: widget.size,
            width: itemWidth,
            decoration: BoxDecoration(
                color: isDark ? Color(0xFF800080) : Color(0xFF440044),
                borderRadius: BorderRadius.all(Radius.circular(8))),
          ),
        ),
        Container(
          child: Row(
            children: <Widget>[
              ...widget.options.map(
                (option) {
                  var _index = widget.options.indexOf(option);
                  return Option(
                    option.label,
                    active: index == _index,
                    index: _index,
                    onChanged: _setIndex,
                    size: widget.size,
                    itemWidth: itemWidth,
                    margin: widget.margin,
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Option extends StatelessWidget {
  final String value;
  final bool active;
  final Function onChanged;
  final int index;
  final double size;
  final double margin;
  final double itemWidth;

  const Option(
    this.value, {
    Key key,
    @required this.active,
    @required this.onChanged,
    @required this.index,
    @required this.size,
    @required this.margin,
    @required this.itemWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = ThemeUtils.isDark(context);

    return GestureDetector(
      onTap: () {
        onChanged(index);
      },
      child: Container(
        height: size,
        color: Colors.transparent,
        width: itemWidth,
        child: Center(
          child: Text(
            value,
            style: TextStyle(
              fontFamily: 'Lato',
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: active
                  ? Colors.white
                  : isDark ? Color(0xFF939393) : Color(0xFF7B7B7B),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
