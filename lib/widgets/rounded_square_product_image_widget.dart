import 'package:flutter/material.dart';

class RoundedSquareProductImageWidget extends StatelessWidget {
  final double size;
  final String url;
  final String heroId;

  const RoundedSquareProductImageWidget({
    Key key,
    this.size = 56,
    @required this.url,
    this.heroId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (heroId != null)
      return Hero(
        tag: heroId,
        transitionOnUserGestures: true,
        child: Image(size: size, url: url),
      );
    else {
      return Image(size: size, url: url);
    }
  }
}

class Image extends StatelessWidget {
  const Image({
    Key key,
    @required this.size,
    @required this.url,
  }) : super(key: key);

  final double size;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
