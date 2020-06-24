import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/widgets/title_with_action_widget.dart';

class StoreHorizontalListWidget extends StatelessWidget {
  final List<Widget> items;
  final String title;

  StoreHorizontalListWidget({this.title, this.items});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 183,
      child: Column(
        children: <Widget>[
          TitleWithActionWidget(title, 'Ver Todos'),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 160,
            padding: EdgeInsets.only(left: 16),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                ...items,
                SizedBox(width: 6),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
