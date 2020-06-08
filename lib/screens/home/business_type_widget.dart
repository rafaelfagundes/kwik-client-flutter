import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/widgets/title_with_action_widget.dart';

import './business_type_button_widget.dart';

class BusinessTypeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 147,
      child: Column(
        children: <Widget>[
          TitleWithActionWidget('Seções', 'Ver Todas'),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 90,
            padding: EdgeInsets.only(left: 16),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                BusinessTypeButtonWidget(),
                BusinessTypeButtonWidget(),
                BusinessTypeButtonWidget(),
                BusinessTypeButtonWidget(),
                BusinessTypeButtonWidget(),
                BusinessTypeButtonWidget(),
                BusinessTypeButtonWidget(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
