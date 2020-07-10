import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:kwik_client_flutter/modules/auth/auth_controller.dart';
import 'package:kwik_client_flutter/modules/auth/auth_response_dto.dart';
import 'package:kwik_client_flutter/modules/auth/auth_store.dart';
import 'package:kwik_client_flutter/utils/theme_utils.dart';
import 'package:kwik_client_flutter/widgets/custom_alert_dialog.dart';
import 'package:provider/provider.dart';

class SocialSignInButtonsWidget extends StatelessWidget {
  final AuthController authController;

  const SocialSignInButtonsWidget({Key key, this.authController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = ThemeUtils.isDark(context);

    void _appleOnPressed() {}

    void _facebookOnPressed() async {
      AuthStore authStore = Provider.of<AuthStore>(context, listen: false);
      AuthResponseDto response = await authController.facebookSignIn();

      switch (response.status) {
        case AuthResponseStatus.ERROR:
          CustomAlertDialog.showDialog(
            context,
            title: 'Não Foi Possível Entrar',
            content: 'Erro ao tentar acessar a conta usando o Facebook.',
          );
          break;
        case AuthResponseStatus.CANCELLED:
          print('Usuário cancelou o login');
          break;
        case AuthResponseStatus.OK:
          authStore.setUser(response.user);
          authStore.setIsLogged(true);
          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
          break;
        case AuthResponseStatus.USER_NOT_FOUND:
          CustomAlertDialog.showDialog(
            context,
            title: 'Erro',
            content:
                'Usuário não encontrado no sistema. Entre em contato conosco.',
          );
          break;
        default:
      }

      // if (_user == null) {
      //   CustomAlertDialog.showDialog(
      //     context,
      //     title: 'Não Foi Possível Entrar',
      //     content: 'Erro ao tentar acessar a conta usando o Facebook.',
      //   );
      // } else if (_user.id == 'cancelledByUser') {
      //   return;
      // } else {
      //   authStore.setUser(_user);

      //   authStore.setIsLogged(true);
      //   Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
      // }
    }

    void _googleOnPressed() async {
      var _user = await authController.googleSignIn();
      var authStore = Provider.of<AuthStore>(context, listen: false);
      if (_user != null) {
        authStore.setUser(_user);

        authStore.setIsLogged(true);
        Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
      } else {
        CustomAlertDialog.showDialog(
          context,
          title: 'Não Foi Possível Entrar',
          content: 'Erro ao tentar acessar a conta usando o Google.',
        );
      }
    }

    return Container(
      child: Row(
        children: <Widget>[
          SocialButton(
            text: 'Apple',
            onPressed: _appleOnPressed,
            color: Color(0xff121212),
            icon: SFSymbols.logo_apple,
            isInverted: isDark,
            invertedColor: Color(0xffFFFFFF),
            verticalIconPosition: -2,
          ),
          SizedBox(width: 10),
          SocialButton(
            text: 'Facebook',
            onPressed: _facebookOnPressed,
            color: Color(0xff3b5998),
            icon: SFSymbols.logo_facebook,
            verticalIconPosition: -1.5,
          ),
          SizedBox(width: 10),
          SocialButton(
            text: 'Google',
            onPressed: _googleOnPressed,
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
      child: GestureDetector(
        onTap: this.onPressed,
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
      ),
    );
  }
}
