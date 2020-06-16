import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/utils/theme_utils.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle(
    this.title, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = ThemeUtils.isDark(context);
    return Text(
      title.toUpperCase(),
      style: TextStyle(
        fontFamily: 'Lato',
        fontSize: 13,
        fontWeight: FontWeight.w900,
        color: isDark ? Color(0xffB0B0B0) : Color(0xff7B7B7B),
      ),
    );
  }
}
