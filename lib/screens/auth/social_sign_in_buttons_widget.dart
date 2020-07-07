import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:kwik_client_flutter/utils/theme_utils.dart';

class SocialSignInButtonsWidget extends StatelessWidget {
  final Function facebookOnPressed;
  final Function googleOnPressed;
  final Function appleOnPressed;

  const SocialSignInButtonsWidget({
    Key key,
    this.facebookOnPressed,
    this.googleOnPressed,
    this.appleOnPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = ThemeUtils.isDark(context);

    return Container(
      child: Row(
        children: <Widget>[
          SocialButton(
            text: 'Apple',
            onPressed: appleOnPressed,
            color: Color(0xff121212),
            icon: SFSymbols.logo_apple,
            isInverted: isDark,
            invertedColor: Color(0xffFFFFFF),
            verticalIconPosition: -2,
          ),
          SizedBox(width: 10),
          SocialButton(
            text: 'Facebook',
            onPressed: facebookOnPressed,
            color: Color(0xff3b5998),
            icon: SFSymbols.logo_facebook,
            verticalIconPosition: -1.5,
          ),
          SizedBox(width: 10),
          SocialButton(
            text: 'Google',
            onPressed: googleOnPressed,
            color: Color(0xff4285F4),
            icon: SFSymbols.logo_google,
            verticalIconPosition: -1.5,
          ),

          // Divider(),
        ],
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final IconData icon;
  final Color color;
  final Color invertedColor;
  final bool isInverted;
  final double verticalIconPosition;

  const SocialButton({
    Key key,
    @required this.text,
    @required this.onPressed,
    @required this.icon,
    @required this.color,
    this.invertedColor,
    this.isInverted = false,
    this.verticalIconPosition = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = ThemeUtils.isDark(context);

    return Expanded(
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 8,
              offset: Offset(0, 2),
              color: color.withOpacity(.3),
            )
          ],
          gradient: isDark
              ? isInverted
                  ? LinearGradient(
                      colors: [invertedColor, invertedColor.withOpacity(0.9)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  : LinearGradient(
                      colors: [color, color.withOpacity(0.9)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
              : isInverted
                  ? LinearGradient(
                      colors: [invertedColor.withOpacity(0.9), invertedColor],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  : LinearGradient(
                      colors: [color.withOpacity(0.9), color],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
          borderRadius: BorderRadius.all(
            Radius.circular(22.5),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 45,
              width: 18,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 13.5 + verticalIconPosition,
                    child: Icon(
                      icon,
                      color: isInverted ? Colors.black : Colors.white,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 5),
            Text(
              text,
              style: TextStyle(
                  color: isInverted ? Colors.black : Colors.white,
                  fontFamily: 'Lato',
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
