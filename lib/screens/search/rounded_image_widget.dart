import 'package:flutter/material.dart';

class RoundedImageWidget extends StatelessWidget {
  final String url;
  final String secondaryUrl;

  const RoundedImageWidget({Key key, @required this.url, this.secondaryUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  blurRadius: 8,
                  offset: Offset(0, 4),
                  color: Colors.black.withOpacity(.05))
            ],
            border: Border.all(color: Theme.of(context).cardColor, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(64 / 2)),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(url),
            ),
          ),
        ),
        if (secondaryUrl != null)
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                border:
                    Border.all(color: Theme.of(context).cardColor, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(24 / 2)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(secondaryUrl),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
