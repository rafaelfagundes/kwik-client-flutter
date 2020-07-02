import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:kwik_client_flutter/utils/theme_utils.dart';

class SearchBarWidget extends StatelessWidget {
  final Function onTap;
  final String hintText;
  final bool autofocus;
  final bool readOnly;

  const SearchBarWidget({
    Key key,
    this.onTap,
    @required this.hintText,
    this.autofocus = false,
    this.readOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = ThemeUtils.isDark(context);

    return Hero(
      tag: 'searchbar',
      transitionOnUserGestures: true,
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          height: 45,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: 8,
                    offset: Offset(0, 4),
                    color: Colors.black.withOpacity(0.05))
              ],
              color: isDark ? Color(0xff232323) : Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 10,
                left: 10,
                child: Icon(SFSymbols.search,
                    color: isDark ? Color(0xFFBBBBBB) : Color(0xFF666666),
                    size: 24),
              ),
              Positioned(
                top: -2,
                left: 42,
                width: MediaQuery.of(context).size.width - 86,
                child: Material(
                  color: Colors.transparent,
                  child: TextField(
                    autocorrect: false,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: hintText,
                        hintStyle: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Lato',
                            color: isDark
                                ? Color(0xFFBBBBBB)
                                : Color(0xFF666666))),
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Lato',
                        color: Theme.of(context).primaryColor),
                    onTap: onTap,
                    autofocus: autofocus,
                    readOnly: readOnly,
                    enableInteractiveSelection: !readOnly,
                  ),
                ),
              )
            ],
          )),
    );
  }
}
