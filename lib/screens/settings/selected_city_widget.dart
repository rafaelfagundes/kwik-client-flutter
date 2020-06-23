import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:kwik_client_flutter/shared/enums.dart';
import 'package:kwik_client_flutter/utils/theme_utils.dart';
import 'package:kwik_client_flutter/widgets/custom_button_widget.dart';

class SelectedCityWidget extends StatelessWidget {
  const SelectedCityWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = ThemeUtils.isDark(context);

    var cities = [
      ItemText('Barbacena - MG'),
      ItemText('Barroso - MG'),
      ItemText('Divinópolis - MG'),
      ItemText('Lavras - MG'),
      ItemText('São João del Rei - MG'),
      ItemText('São Tiago - MG'),
      ItemText('Tiradentes - MG'),
    ];

    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: isDark ? Color(0xFF232323) : Color(0xFFFFFFFF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(16.0),
              ),
            ),
            content: Container(
              height: 273,
              child: Column(
                children: <Widget>[
                  Text(
                    'Selecione a cidade onde você está',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Container(
                    height: 150,
                    child: CupertinoPicker(
                        itemExtent: 30,
                        onSelectedItemChanged: null,
                        children: cities),
                  ),
                  CustomButtonWidget(buttonText: 'Selecionar', onPressed: null),
                  SizedBox(height: 16),
                  CustomButtonWidget(
                      buttonFillType: ButtonFillType.BORDER,
                      buttonType: ButtonType.CANCEL,
                      buttonText: 'Cancelar',
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ],
              ),
            ),
          );
        },
      );
    }

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
                onPressed: _showMyDialog,
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

class ItemText extends StatelessWidget {
  final String title;

  const ItemText(this.title, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontFamily: 'Lato',
          fontSize: 16,
        ),
      ),
    );
  }
}
