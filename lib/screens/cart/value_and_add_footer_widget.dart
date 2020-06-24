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
  final double bottomPosition;
  final bool isLastScreen;

  const ValueAndAddFooterWidget({
    Key key,
    @required this.label,
    @required this.value,
    @required this.valueSize,
    @required this.onPressed,
    this.bottomPosition = 0,
    this.isLastScreen = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var paddingBottom = MediaQuery.of(context).padding.bottom;

    return Positioned(
      bottom: bottomPosition,
      child: Container(
        height: 65 + paddingBottom,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 12,
            bottom:
                paddingBottom > 0 ? MediaQuery.of(context).padding.bottom : 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            TotalValueWidget(
              label: label,
              value: value,
              valueSize: valueSize,
            ),
            Container(
              width: 130,
              child: CustomButtonWidget(
                buttonType:
                    isLastScreen ? ButtonType.CONFIRMATION : ButtonType.DEFAULT,
                buttonText: isLastScreen ? 'Concluir Pedido' : 'Continuar',
                onPressed: onPressed,
                icon: isLastScreen ? null : SFSymbols.arrow_right,
                verticalIconAjustment: -0.75,
                iconOnRight: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
