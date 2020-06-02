import 'package:flutter/material.dart';

class BusinessTypeButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Column(
        children: <Widget>[
          Container(
            height: 64,
            width: 64,
            child: Image.asset(
              'assets/images/business-types/Bebidas.png',
              fit: BoxFit.contain,
            ),
          ),
          Text(
            'Bebidas',
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 12,
                fontFamily: 'Lato'),
          )
        ],
      ),
    );
  }
}
