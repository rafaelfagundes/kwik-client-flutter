import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:kwik_client_flutter/utils/theme_utils.dart';

class SearchHeaderWidget extends StatelessWidget {
  final double headerSize;

  const SearchHeaderWidget({Key key, this.headerSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context);
    var isDark = ThemeUtils.isDark(context);

    return Container(
      height: headerSize,
      width: double.infinity,
      padding: EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 32,
              width: 32,
              margin: EdgeInsets.only(left: 8),
              child: Center(
                child: Icon(
                  SFSymbols.chevron_left,
                  color: Theme.of(context).primaryColor,
                  size: 32,
                ),
              ),
            ),
          ),
          Container(
            width: mq.size.width - (64.0 * 2),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                  color: isDark ? Color(0xff232323) : Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 8,
                      offset: Offset(0, 4),
                      color: Colors.black.withOpacity(0.05),
                    ),
                  ]),
              child: TextField(
                enableSuggestions: false,
                maxLines: 1,
                textAlign: TextAlign.start,
                autocorrect: false,
                autofocus: true,
                style: TextStyle(
                  fontFamily: 'Lato',
                ),
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'Pesquisa'),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 32,
              width: 32,
              margin: EdgeInsets.only(right: 16, left: 6),
              child: Center(
                child: Icon(
                  SFSymbols.search,
                  color: Theme.of(context).primaryColor,
                  size: 32,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
