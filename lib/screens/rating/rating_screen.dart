import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/widgets/default_screen_widget.dart';

class Rating extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultScreen(
      'Avaliação',
      children: <Widget>[Text('Rating')],
    );
  }
}
