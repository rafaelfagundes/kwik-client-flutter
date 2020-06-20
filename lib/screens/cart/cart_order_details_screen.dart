import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:intl/intl.dart';
import 'package:kwik_client_flutter/screens/cart/value_and_add_footer_widget.dart';
import 'package:kwik_client_flutter/shared/enums.dart';
import 'package:kwik_client_flutter/utils/theme_utils.dart';
import 'package:kwik_client_flutter/widgets/custom_multiline_text_field.dart';
import 'package:kwik_client_flutter/widgets/custom_text_field.dart';
import 'package:kwik_client_flutter/widgets/default_screen_widget.dart';
import 'package:kwik_client_flutter/widgets/label_and_switch_widget.dart';
import 'package:kwik_client_flutter/widgets/section_title_widget.dart';
import 'package:kwik_client_flutter/widgets/slide_switch_widget.dart';

class CartOrderDetailsScreen extends StatefulWidget {
  @override
  _CartOrderDetailsScreenState createState() => _CartOrderDetailsScreenState();
}

class _CartOrderDetailsScreenState extends State<CartOrderDetailsScreen> {
  DeliveryType deliveryType = DeliveryType.DELIVERY;
  PaymentType paymentType = PaymentType.CARD;

  bool hasCoupon = false;
  double couponFieldHeight = 0;

  void _setDeliveryType(value) {
    deliveryType = value;
  }

  void _setPaymentType(value) {
    paymentType = value;
  }

  void _setHasCoupon(value) {
    setState(() {
      hasCoupon = value;
      couponFieldHeight = value ? 59 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    var isDark = ThemeUtils.isDark(context);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          DefaultScreen(
            'Dados do Pedido',
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SectionTitle('Entregar ou retirar no local?'),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SlideSwitchWidget(
                  value: deliveryType,
                  onChanged: _setDeliveryType,
                  options: [
                    SlideSwitchOption(
                        label: 'Entregar', value: DeliveryType.DELIVERY),
                    SlideSwitchOption(
                        label: 'Vou Retirar', value: DeliveryType.PICKUP),
                  ],
                ),
              ),
              SizedBox(height: 26),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SectionTitle(
                  'Endereço de entrega',
                  buttonText: 'alterar',
                  onPressed: () {},
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            SFSymbols.location,
                            color: Theme.of(context).primaryColor,
                            size: 16,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Guarda-Mor',
                            style: TextStyle(
                                fontFamily: 'Lato',
                                color: Theme.of(context).primaryColor),
                          )
                        ],
                      ),
                      Text(
                        NumberFormat.simpleCurrency(locale: 'pt_BR').format(8),
                        style: TextStyle(
                          fontFamily: 'Lato',
                          color: Color(0xff6BC273),
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 26),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SectionTitle('Forma de pagamento'),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SlideSwitchWidget(
                  value: deliveryType,
                  onChanged: _setPaymentType,
                  options: [
                    SlideSwitchOption(label: 'Cartão', value: PaymentType.CARD),
                    SlideSwitchOption(
                        label: 'Dinheiro', value: PaymentType.CASH),
                  ],
                ),
              ),
              SizedBox(height: 26),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SectionTitle('Cupom de desconto'),
              ),
              LabelAndSwitchWidget(
                  label: 'Possui cupom de desconto',
                  value: hasCoupon,
                  onChanged: (value) {
                    _setHasCoupon(value);
                  }),
              if (hasCoupon) SizedBox(height: 10),
              AnimatedContainer(
                duration: Duration(seconds: 2),
                curve: Curves.fastOutSlowIn,
                child: Container(
                  height: couponFieldHeight,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: CustomTextField(
                    labelText: 'Cupom de Desconto',
                  ),
                ),
              ),
              SizedBox(height: 26),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SectionTitle('Observações Sobre o Pedido'),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomMultilineTextField(
                  labelText: 'Observações',
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 65,
                  // color: Colors.transparent,
                  color: Theme.of(context)
                      .scaffoldBackgroundColor
                      .withOpacity(isDark ? 0.3 : 0.85),
                ),
              ),
            ),
          ),
          ValueAndAddFooterWidget(
            label: 'Total do Carrinho',
            value: 46,
            valueSize: 16,
            onPressed: () {
              Navigator.pushNamed(context, '/cart-order-details');
            },
            bottomPosition: 0,
          ),
        ],
      ),
    );
  }
}
