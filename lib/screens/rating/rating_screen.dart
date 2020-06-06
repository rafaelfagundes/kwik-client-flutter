import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/screens/rating/rating_stars_widget.dart';
import 'package:kwik_client_flutter/widgets/action_button_widget.dart';
import 'package:kwik_client_flutter/widgets/custom_multiline_text_field.dart';
import 'package:kwik_client_flutter/widgets/custom_text_field.dart';
import 'package:kwik_client_flutter/widgets/default_screen_widget.dart';
import 'package:kwik_client_flutter/widgets/rounded_store_logo_widget.dart';

class Rating extends StatefulWidget {
  @override
  _RatingState createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  int _starsSelected = 0;

  void handleStarsSelection(int starQty) {
    setState(() {
      _starsSelected = starQty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScreen(
      'Avaliação',
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundedStoreLogoWidget(
                animationDuration: 100,
                url:
                    'https://res.cloudinary.com/kardappio/image/upload/v1590475069/hzy36cj4phbearm7wwrc.png',
                size: 64)
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                width: 205,
                child: Text(
                    'Diga à todos como foi sua experiência em McDonald’s',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 16,
                        color: Theme.of(context).primaryColor)))
          ],
        ),
        SizedBox(height: 30),
        RatingStarsWidget(
            starsSelected: _starsSelected, onChange: handleStarsSelection),
        SizedBox(height: 30),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: CustomTextField(labelText: 'Título')),
        SizedBox(height: 20),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: CustomMultilineTextField(
              labelText: 'Avaliação',
              helperText: 'Fale tudo de importante sobre o seu pedido',
            )),
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ActionButton(
            buttonText: 'Enviar',
            onPressed: () {},
          ),
        )
      ],
    );
  }
}
