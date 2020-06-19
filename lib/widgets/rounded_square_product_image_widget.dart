import 'package:flutter/material.dart';

class RoundedSquareProductImageWidget extends StatelessWidget {
  final double size;
  final String url;
  final String heroId;

  const RoundedSquareProductImageWidget({
    Key key,
    this.size = 56,
    @required this.url,
    this.heroId = 'N/A',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: heroId,
      transitionOnUserGestures: true,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(url),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
      ),
    );
  }
}
