import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/utils/theme_utils.dart';

class CustomIconWidget extends StatelessWidget {
  final String name;
  final double size;

  const CustomIconWidget({
    Key key,
    @required this.name,
    this.size = 18.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = ThemeUtils.isDark(context);
    String darkOrLight = isDark ? 'dark' : 'light';

    return Container(
      width: size,
      height: size,
      child: Image.asset(
        'assets/icons/$darkOrLight/$name.png',
      ),
    );
  }
}
