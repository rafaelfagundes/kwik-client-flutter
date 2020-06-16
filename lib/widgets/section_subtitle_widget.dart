import 'package:flutter/material.dart';

class SectionSubTitle extends StatelessWidget {
  final String title;

  const SectionSubTitle(
    this.title, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title.toUpperCase(),
      style: TextStyle(
        fontFamily: 'Lato',
        fontSize: 11,
        fontWeight: FontWeight.w900,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
