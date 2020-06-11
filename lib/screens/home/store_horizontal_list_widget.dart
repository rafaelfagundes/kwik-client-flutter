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
                StoreHorizontalItemWidget(
                  id: '234261a7-3ef4-4145-9b53-adecba61e055',
                  title: 'McDonald\'s',
                  logo:
                      'https://res.cloudinary.com/kardappio/image/upload/v1590475069/hzy36cj4phbearm7wwrc.png',
                  color: Colors.yellow[600],
                  deliveryTimes: [15, 60],
                  rating: 4.5,
                  numberOfRatings: 487,
                ),
                StoreHorizontalItemWidget(
                  id: '40101498-ded0-4179-8de5-6f0dd815183e',
                  title: 'Maria Fumaça Lanches',
                  logo:
                      'https://res.cloudinary.com/kardappio/image/upload/v1588896819/qw8zawqs1j1al7geejd8.png',
                  color: Colors.purple[600],
                  deliveryTimes: [12, 42],
                  rating: 3.3,
                  numberOfRatings: 256,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
