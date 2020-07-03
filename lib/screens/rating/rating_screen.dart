import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/screens/rating/rating_stars_widget.dart';
import 'package:kwik_client_flutter/shared/enums.dart';
import 'package:kwik_client_flutter/utils/image_utils.dart';
import 'package:kwik_client_flutter/utils/theme_utils.dart';
import 'package:kwik_client_flutter/widgets/custom_button_widget.dart';
import 'package:kwik_client_flutter/widgets/custom_multiline_text_field.dart';
import 'package:kwik_client_flutter/widgets/custom_text_field.dart';
import 'package:kwik_client_flutter/widgets/default_screen_widget.dart';
import 'package:kwik_client_flutter/widgets/rounded_store_logo_widget.dart';

import 'rating_dialog_inner_widget.dart';

class RatingScreen extends StatefulWidget {
  @override
  _RatingScreenState createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  int _starsSelected = 0;

  void handleStarsSelection(int starQty) {
    setState(() {
      _starsSelected = starQty;
    });
  }

  @override
  Widget build(BuildContext context) {
    var isDark = ThemeUtils.isDark(context);

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
            content: RatingDialogInnerWidget(local: 'McDonald\'s'),
          );
        },
      );
    }

    return DefaultScreen(
      'Avaliação',
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundedStoreLogoWidget(
              animationDuration: 100,
              url: ImageUtils.resizeCloudinaryImageFromUrl(
                  'https://res.cloudinary.com/kardappio/image/upload/v1590475069/hzy36cj4phbearm7wwrc.png',
                  64 * 3),
              size: 64,
              heroId: 'N/D',
            )
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
          child: CustomButtonWidget(
            buttonType: ButtonType.DEFAULT,
            buttonText: 'Enviar Avaliação',
            onPressed: () {
              _showMyDialog();
            },
          ),
        )
      ],
    );
  }
}
