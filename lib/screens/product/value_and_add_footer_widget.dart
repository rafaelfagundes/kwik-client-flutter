import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:kwik_client_flutter/shared/enums.dart';
import 'package:kwik_client_flutter/widgets/custom_button_widget.dart';
import 'package:kwik_client_flutter/widgets/total_value_widget.dart';

class ValueAndAddFooterWidget extends StatelessWidget {
  final String label;
  final double value;
  final double valueSize;
  final Function onPressed;

  const ValueAndAddFooterWidget(
      {Key key,
      @required this.label,
      @required this.value,
      @required this.valueSize,
      @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        height: 65,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            TotalValueWidget(
              label: label,
              value: value,
              valueSize: valueSize,
            ),
            Container(
              width: 210,
              child: CustomButtonWidget(
                buttonType: ButtonType.CONFIRMATION,
                buttonText: 'Adicionar ao Carrinho',
                onPressed: onPressed,
                icon: SFSymbols.cart_badge_plus,
                verticalIconAjustment: -0.75,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
