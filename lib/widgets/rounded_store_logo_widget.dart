import 'package:flutter/material.dart';

class RoundedStoreLogoWidget extends StatelessWidget {
  final double size;

  const RoundedStoreLogoWidget({Key key, this.size = 64}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.elliptical(32.0, 32.0)),
        image: DecorationImage(
          image: const AssetImage('assets/images/StoreLogo.png'),
          fit: BoxFit.cover,
        ),
        border: Border.all(width: 2.0, color: const Color(0xffffffff)),
        boxShadow: [
          BoxShadow(
            color: const Color(0x0d000000),
            offset: Offset(0, 4),
            blurRadius: 16,
          ),
        ],
      ),
    );
  }
}
