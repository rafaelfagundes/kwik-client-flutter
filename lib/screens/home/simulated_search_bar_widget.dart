import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:kwik_client_flutter/utils/theme_utils.dart';

class SimulatedSearchBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var isDark = ThemeUtils.isDark(context);

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/search');
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  blurRadius: 8,
                  offset: Offset(0, 4),
                  color: Colors.black.withOpacity(0.05))
            ],
            color: isDark ? Color(0xff232323) : Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Row(
          children: <Widget>[
            Icon(SFSymbols.search,
                color: isDark ? Color(0xFFBBBBBB) : Color(0xFF666666)),
            SizedBox(
              width: 5,
            ),
            Text(
              'O que deseja hoje?',
              style: TextStyle(
                  fontFamily: 'Lato',
                  color: isDark ? Color(0xFFBBBBBB) : Color(0xFF666666)),
            )
          ],
        ),
      ),
    );
  }
}
