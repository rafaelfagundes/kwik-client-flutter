import 'package:flutter/material.dart';

class ShadowWidget extends StatefulWidget {
  const ShadowWidget({
    Key key,
  }) : super(key: key);

  @override
  _ShadowWidgetState createState() => _ShadowWidgetState();
}

class _ShadowWidgetState extends State<ShadowWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );

    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();

    return FadeTransition(
      opacity: _animation,
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black, Colors.transparent])),
      ),
    );
  }
}
