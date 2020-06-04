import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:kwik_client_flutter/stores/app_store.dart';
import 'package:provider/provider.dart';

class SimulatedSearchBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AppStore>(context);

    return Observer(
      builder: (_) => Container(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Row(
                children: <Widget>[
                  Icon(SFSymbols.search,
                      color:
                          store.isDark ? Color(0xFFBBBBBB) : Color(0xFF666666)),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'O que você vai querer hoje?',
                    style: TextStyle(
                        fontFamily: 'Lato',
                        color: store.isDark
                            ? Color(0xFFBBBBBB)
                            : Color(0xFF666666)),
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
