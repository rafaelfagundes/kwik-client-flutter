import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:kwik_client_flutter/utils/theme_utils.dart';
import 'package:kwik_client_flutter/widgets/search_bar_widget.dart';

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
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.center,
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
            width: MediaQuery.of(context).size.width - 40,
            height: 45,
            child: SearchBarWidget(
              hintText: 'O que deseja hoje?',
              autofocus: true,
            ),
          )
        ],
      ),
    );
  }
}
