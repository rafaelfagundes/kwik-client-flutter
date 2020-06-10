import 'package:flutter/material.dart';

class ScreenDetailsMenuWidget extends StatelessWidget {
  const ScreenDetailsMenuWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Destaques',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 14,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w700,
              )),
          Text('Cardápio',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 14,
                color: Theme.of(context).primaryColor.withOpacity(.6),
                fontWeight: FontWeight.w400,
              )),
          Text('Avaliações',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 14,
                color: Theme.of(context).primaryColor.withOpacity(.6),
                fontWeight: FontWeight.w400,
              )),
          Text('Informações',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 14,
                color: Theme.of(context).primaryColor.withOpacity(.6),
                fontWeight: FontWeight.w400,
              )),
        ],
      ),
    );
  }
}
