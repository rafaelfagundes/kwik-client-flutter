import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kwik_client_flutter/shared/enums.dart';
import 'package:kwik_client_flutter/widgets/custom_button_widget.dart';
import 'package:kwik_client_flutter/widgets/default_screen_widget.dart';
import 'package:kwik_client_flutter/widgets/rounded_store_logo_widget.dart';
import 'package:kwik_client_flutter/widgets/success_animation.dart';

class CartOrderSucessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultScreen(
      'Pedido Concluído',
      // paddingTop: false,
      children: <Widget>[
        Stack(
          children: <Widget>[
            Positioned(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                padding: EdgeInsets.all(32),
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundedStoreLogoWidget(
                            size: 72,
                            url:
                                'https://res.cloudinary.com/kardappio/image/upload/v1590475069/hzy36cj4phbearm7wwrc.png',
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'McDonald\'s',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                '#HM3MVXY2QS',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).accentColor,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                DateFormat('dd/MM/yyyy HH:mm')
                                    .format(DateTime.now()),
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).disabledColor,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Você será notificado assim que o pedido for confirmado pelo estabelecimento',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Theme.of(context).primaryColor),
                    ),
                    SizedBox(height: 36),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      child: CustomButtonWidget(
                        buttonType: ButtonType.CALL_TO_ACTION_ALTERNATIVE,
                        buttonText: 'Ir Para o Início',
                        onPressed: () {
                          Navigator.pushNamed(context, '/orders');
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 10,
              left: 64,
              child: SuccessAnimation(size: 76),
            ),
          ],
        )
      ],
    );
  }
}
