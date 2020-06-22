import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/widgets/custom_button_widget.dart';
import 'package:kwik_client_flutter/widgets/success_animation.dart';

class RatingDialogInnerWidget extends StatelessWidget {
  final String local;

  const RatingDialogInnerWidget({
    Key key,
    @required this.local,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 206,
      child: Column(
        children: <Widget>[
          Text(
            'Sucesso!',
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Lato',
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
          SuccessAnimation(size: 96),
          Center(
            child: Text(
              'Obrigado por avaliar $local',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Lato',
                fontWeight: FontWeight.normal,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(height: 26),
          CustomButtonWidget(
              buttonText: 'Voltar',
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
