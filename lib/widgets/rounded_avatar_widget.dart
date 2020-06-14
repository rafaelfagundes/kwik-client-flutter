import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class RoundedAvatarWidget extends StatelessWidget {
  final int animationDuration;
  final double size;
  final String url;

  const RoundedAvatarWidget({
    Key key,
    this.animationDuration = 1000,
    this.size = 64,
    @required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(
        milliseconds: animationDuration,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(size / 2)),
        border: Border.all(width: 2, color: Colors.white),
        boxShadow: [
          BoxShadow(
            color: const Color(0x0d000000),
            offset: Offset(0, 4),
            blurRadius: 8,
          ),
        ],
      ),
      constraints: BoxConstraints(
        minHeight: size,
        maxHeight: size,
        minWidth: size,
        maxWidth: size,
      ),
      child: ClipOval(
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: url,
          placeholder: (context, url) => CircularProgressIndicator(),
        ),
      ),
    );
  }
}
