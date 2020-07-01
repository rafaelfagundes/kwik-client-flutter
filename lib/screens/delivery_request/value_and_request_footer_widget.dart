import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/shared/enums.dart';
import 'package:kwik_client_flutter/widgets/custom_button_widget.dart';
import 'package:kwik_client_flutter/widgets/total_value_widget.dart';

class ValueAndRequestFooterWidget extends StatelessWidget {
  final String label;
  final double value;
  final double valueSize;
  final Function onPressed;
  final double bottomPosition;
  final bool isLastScreen;

  const ValueAndRequestFooterWidget({
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

    return Container(
      height: 45 + paddingBottom,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          TotalValueWidget(
            label: label,
            value: value,
            valueSize: valueSize,
          ),
          Container(
            width: 145,
            child: CustomButtonWidget(
              buttonType: ButtonType.CONFIRMATION,
              buttonText: 'Fazer Solicitação',
              onPressed: onPressed,
            ),
          ),
        ],
      ),
    );
  }
}
