import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/shared/enums.dart';

class CustomButtonWidget extends StatefulWidget {
  final String buttonText;
  final IconData icon;
  final Function onPressed;
  final ButtonType buttonType;
  final ButtonFillType buttonFillType;
  final double verticalIconAjustment;
  final bool iconOnRight;

  const CustomButtonWidget(
      {Key key,
      this.buttonText,
      this.onPressed,
      this.icon,
      this.buttonType = ButtonType.DEFAULT,
      this.buttonFillType = ButtonFillType.FILLED,
      this.verticalIconAjustment = -1,
      this.iconOnRight = false})
      : super(key: key);

  @override
  _CustomButtonWidgetState createState() => _CustomButtonWidgetState();
}

class _CustomButtonWidgetState extends State<CustomButtonWidget>
    with SingleTickerProviderStateMixin {
  double buttonHeight = 45.0;
  double buttonMargin = 0.0;
  double buttonFontSize = 12;
  double buttonIconSize = 22;
  double buttonSpacer = 5;
  Color shadowColor = Colors.black12;
  double topPosition;

  @override
  void initState() {
    super.initState();
    topPosition = widget.verticalIconAjustment;
  }

  List<Color> _getColors(bool isDark, ButtonType buttonType) {
    switch (buttonType) {
      case ButtonType.DEFAULT:
        return [Color(0xff800080), Color(0xffCC00CC)];
        break;
      case ButtonType.CONFIRMATION:
        return [Color(0xff17B890), Color(0xff19C89C)];
        break;
      case ButtonType.CANCEL:
        return [Color(0xffE00000), Color(0xffFF0A0A)];
        break;
      case ButtonType.CALL_TO_ACTION:
        return [Color(0xffE0A800), Color(0xffFFCC33)];
        break;
      case ButtonType.CALL_TO_ACTION_ALTERNATIVE:
        return [Color(0xff007FE0), Color(0xff008BF8)];
        break;
      case ButtonType.DISABLED:
        return [Color(0xffa28f9d), Color(0xffb5a6b1)];
        break;
      default:
        return [Color(0xff800080), Color(0xff440044)];
    }
  }

  BoxDecoration _getDecoration(
      bool isDark, ButtonType buttonType, ButtonFillType buttonFillType) {
    switch (buttonFillType) {
      case ButtonFillType.BORDER:
        return BoxDecoration(
          border:
              Border.all(color: _getColors(isDark, buttonType)[0], width: 2),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        );
        break;
      case ButtonFillType.EMPTY:
        return BoxDecoration();
        break;
      case ButtonFillType.FILLED:
        return BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: _getColors(isDark, buttonType),
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            boxShadow: [
              BoxShadow(blurRadius: 8, offset: Offset(0, 2), color: shadowColor)
            ]);
        break;
      default:
        return BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: _getColors(isDark, buttonType),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        );
    }
  }

  Color _getFontColor(
      bool isDark, ButtonType buttonType, ButtonFillType buttonFillType) {
    switch (buttonFillType) {
      case ButtonFillType.FILLED:
        return Colors.white;
        break;
      default:
        return isDark
            ? _getColors(isDark, buttonType)[1]
            : _getColors(isDark, buttonType)[0];
    }
  }

  void _buttonPressed() {
    setState(() {
      buttonHeight = 45 * 0.8;
      buttonMargin = (45 - 45 * 0.8);
      buttonFontSize = 12 * 0.8;
      shadowColor = Colors.transparent;
      buttonIconSize = 22 * 0.8;
      buttonSpacer = 5 * 0.8;
      topPosition = widget.verticalIconAjustment * 1.5;
    });
  }

  void _buttonReleased() {
    setState(() {
      buttonHeight = 45;
      buttonMargin = 0;
      buttonFontSize = 12;
      shadowColor = Colors.black12;
      buttonIconSize = 22;
      buttonSpacer = 5;
      topPosition = widget.verticalIconAjustment;
    });
  }

  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).brightness.toString() == "Brightness.dark";
    return GestureDetector(
      onTapDown: (_) {
        _buttonPressed();
      },
      onTapUp: (_) {
        _buttonReleased();
      },
      onTapCancel: () {
        _buttonReleased();
      },
      onTap: () {
        widget.onPressed();
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 50),
        curve: Curves.linear,
        height: buttonHeight,
        margin: EdgeInsets.only(
            left: buttonMargin,
            right: buttonMargin,
            bottom: buttonMargin / 2,
            top: buttonMargin / 2),
        decoration:
            _getDecoration(isDark, widget.buttonType, widget.buttonFillType),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (widget.icon != null && widget.iconOnRight == false)
              AnimatedContainer(
                curve: Curves.linear,
                duration: Duration(milliseconds: 50),
                width: buttonIconSize + buttonSpacer,
                height: buttonIconSize,
                child: Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    AnimatedPositioned(
                      curve: Curves.linear,
                      top: topPosition,
                      duration: Duration(milliseconds: 50),
                      width: buttonIconSize + buttonSpacer,
                      height: buttonIconSize,
                      child: LayoutBuilder(
                        builder: (context, constraint) {
                          return Icon(widget.icon,
                              size: constraint.biggest.height,
                              color: _getFontColor(isDark, widget.buttonType,
                                  widget.buttonFillType));
                        },
                      ),
                    )
                  ],
                ),
              ),
            if (widget.buttonText != null)
              AnimatedDefaultTextStyle(
                style: TextStyle(
                  fontSize: buttonFontSize,
                  color: _getFontColor(
                      isDark, widget.buttonType, widget.buttonFillType),
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Lato',
                ),
                duration: const Duration(milliseconds: 50),
                curve: Curves.linear,
                child: Text(
                  widget.buttonText.toUpperCase(),
                ),
              ),
            if (widget.icon != null && widget.iconOnRight)
              AnimatedContainer(
                curve: Curves.linear,
                duration: Duration(milliseconds: 50),
                width: buttonIconSize,
                height: buttonIconSize,
                // color: Colors.black,
                child: Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    AnimatedPositioned(
                      curve: Curves.linear,
                      top: topPosition,
                      right: -5,
                      duration: Duration(milliseconds: 50),
                      width: buttonIconSize,
                      height: buttonIconSize,
                      child: LayoutBuilder(
                        builder: (context, constraint) {
                          return Icon(widget.icon,
                              size: constraint.biggest.height,
                              color: _getFontColor(isDark, widget.buttonType,
                                  widget.buttonFillType));
                        },
                      ),
                    )
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
