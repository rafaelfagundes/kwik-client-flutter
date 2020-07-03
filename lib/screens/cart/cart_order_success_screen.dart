import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kwik_client_flutter/shared/enums.dart';
import 'package:kwik_client_flutter/utils/image_utils.dart';
import 'package:kwik_client_flutter/widgets/custom_button_widget.dart';
import 'package:kwik_client_flutter/widgets/default_screen_widget.dart';
import 'package:kwik_client_flutter/widgets/rounded_store_logo_widget.dart';
import 'package:kwik_client_flutter/widgets/success_animation.dart';

class CartOrderSucessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultScreen(
      'Pedido Concluído',
      children: <Widget>[
        Container(
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              boxShadow: [
                BoxShadow(
                  color: const Color(0x0d000000),
                  offset: Offset(0, 4),
                  blurRadius: 16,
                ),
              ],
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            child: Container(
              padding: EdgeInsets.fromLTRB(32, 32, 32, 32),
              child: Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Positioned(
                    left: 36,
                    child: Container(
                      height: 72,
                      width: 72,
                      child: Stack(
                        overflow: Overflow.visible,
                        children: <Widget>[
                          Positioned(
                            top: 0,
                            left: 0,
                            child: RoundedStoreLogoWidget(
                              size: 72,
                              url: ImageUtils.resizeCloudinaryImageFromUrl(
                                  'https://res.cloudinary.com/kardappio/image/upload/v1590475069/hzy36cj4phbearm7wwrc.png',
                                  72 * 3),
                            ),
                          ),
                          Positioned(
                            top: -18,
                            left: -28,
                            child: SuccessAnimation(size: 64),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                            width: 120,
                          ),
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
                                  fontWeight: FontWeight.w900,
                                  color: Theme.of(context).accentColor,
                                  fontSize: 16,
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
                      SizedBox(height: 30),
                      Text(
                        'Uma notificação será enviada quando o pedido for confirmado pelo estabelecimento',
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
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              '/',
                              (route) => false,
                            );
                          },
                        ),
                      )
                    ],
                  )
                ],
              ),
            ))
      ],
    );
  }
}
