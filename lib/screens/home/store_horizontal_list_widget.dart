import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/widgets/store_horizontal_item_widget.dart';
import 'package:kwik_client_flutter/widgets/title_with_action_widget.dart';

class StoreHorizontalListWidget extends StatelessWidget {
  final String title;

  StoreHorizontalListWidget(this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 162,
      child: Column(
        children: <Widget>[
          TitleWithActionWidget(title, 'Ver Todos'),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 130,
            padding: EdgeInsets.only(left: 16),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                StoreHorizontalItemWidget(),
                StoreHorizontalItemWidget(),
                StoreHorizontalItemWidget(),
                StoreHorizontalItemWidget(),
                StoreHorizontalItemWidget(),
                StoreHorizontalItemWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
