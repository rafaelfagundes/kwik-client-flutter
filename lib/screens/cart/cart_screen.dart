import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/widgets/default_screen_widget.dart';

import 'value_and_add_footer_widget.dart';

class Cart extends StatelessWidget {
  var bottomBarSize = 48.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        DefaultScreen(
          'Carrinho',
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                  'Aut perferendis maxime dolor sunt saepe. Eos et consequatur autem vitae quia cupiditate omnis aspernatur facilis. Voluptates voluptas quis quaerat earum sit pariatur. Sint ullam cupiditate. Eum libero eos autem debitis repudiandae. Sint voluptatem eveniet rerum consequatur eum dolorem est impedit explicabo.'),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                  'Aut perferendis maxime dolor sunt saepe. Eos et consequatur autem vitae quia cupiditate omnis aspernatur facilis. Voluptates voluptas quis quaerat earum sit pariatur. Sint ullam cupiditate. Eum libero eos autem debitis repudiandae. Sint voluptatem eveniet rerum consequatur eum dolorem est impedit explicabo.'),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                  'Aut perferendis maxime dolor sunt saepe. Eos et consequatur autem vitae quia cupiditate omnis aspernatur facilis. Voluptates voluptas quis quaerat earum sit pariatur. Sint ullam cupiditate. Eum libero eos autem debitis repudiandae. Sint voluptatem eveniet rerum consequatur eum dolorem est impedit explicabo.'),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                  'Aut perferendis maxime dolor sunt saepe. Eos et consequatur autem vitae quia cupiditate omnis aspernatur facilis. Voluptates voluptas quis quaerat earum sit pariatur. Sint ullam cupiditate. Eum libero eos autem debitis repudiandae. Sint voluptatem eveniet rerum consequatur eum dolorem est impedit explicabo.'),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                  'Aut perferendis maxime dolor sunt saepe. Eos et consequatur autem vitae quia cupiditate omnis aspernatur facilis. Voluptates voluptas quis quaerat earum sit pariatur. Sint ullam cupiditate. Eum libero eos autem debitis repudiandae. Sint voluptatem eveniet rerum consequatur eum dolorem est impedit explicabo.'),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                  'Aut perferendis maxime dolor sunt saepe. Eos et consequatur autem vitae quia cupiditate omnis aspernatur facilis. Voluptates voluptas quis quaerat earum sit pariatur. Sint ullam cupiditate. Eum libero eos autem debitis repudiandae. Sint voluptatem eveniet rerum consequatur eum dolorem est impedit explicabo.'),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                  'Aut perferendis maxime dolor sunt saepe. Eos et consequatur autem vitae quia cupiditate omnis aspernatur facilis. Voluptates voluptas quis quaerat earum sit pariatur. Sint ullam cupiditate. Eum libero eos autem debitis repudiandae. Sint voluptatem eveniet rerum consequatur eum dolorem est impedit explicabo.'),
            ),
            SizedBox(height: bottomBarSize),
          ],
        ),
        Positioned(
          bottom: 0,
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 112,
                color: Colors.transparent,
              ),
            ),
          ),
        ),
        ValueAndAddFooterWidget(
            label: 'Total do Carrinho',
            value: 45.0,
            valueSize: 16,
            onPressed: () {},
            bottomPosition: bottomBarSize),
      ],
    );
  }
}
