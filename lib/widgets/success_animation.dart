import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class SuccessAnimation extends StatelessWidget {
  final double size;

  const SuccessAnimation({Key key, this.size = 200}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      child: FlareActor(
        'assets/animations/success_light.flr',
        fit: BoxFit.contain,
        isPaused: false,
        animation: 'success',
      ),
    );
  }
}
