import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/models/product_option_model.dart';
import 'package:kwik_client_flutter/utils/theme_utils.dart';

class OptionsListWidget extends StatelessWidget {
  final List<ProductOption> productOptions;

  const OptionsListWidget({
    Key key,
    @required this.productOptions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = ThemeUtils.isDark(context);

    return Container(
      width: MediaQuery.of(context).size.width - 150,
      child: Wrap(
        spacing: 5,
        runSpacing: 5,
        children: <Widget>[
          ...productOptions.map((option) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              decoration: BoxDecoration(
                color: isDark ? Color(0xff3F3F3F) : Color(0xffF8F8F8),
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
              child: Text(
                option.label,
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontFamily: 'Lato',
                    fontSize: 10,
                    fontWeight: FontWeight.w700),
              ),
            );
          })
        ],
      ),
    );
  }
}
