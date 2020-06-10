import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';

class SelectedCityWidget extends StatelessWidget {
  const SelectedCityWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.only(left: 10),
      width: double.infinity,
      height: 60.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Theme.of(context).cardColor,
        boxShadow: [
          BoxShadow(
            color: const Color(0x0d000000),
            offset: Offset(0, 4),
            blurRadius: 16,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                SFSymbols.location_fill,
                color: Theme.of(context).primaryColor,
                size: 28,
              ),
              SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Mostrando locais de',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 12,
                      color: Theme.of(context).primaryColor,
                      letterSpacing: 0.003,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 2),
                  Text(
                    'São João del Rei, MG',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 14,
                      color: Theme.of(context).primaryColor,
                      letterSpacing: 0.0035,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                onPressed: null,
                child: Text(
                  'Alterar',
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 14,
                    color: Theme.of(context).accentColor,
                    letterSpacing: 0.0035,
                    // fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
