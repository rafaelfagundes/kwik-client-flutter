import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kwik_client_flutter/shared/enums.dart';
import 'package:kwik_client_flutter/utils/theme_utils.dart';
import 'package:kwik_client_flutter/widgets/auth_illustration_widget.dart';
import 'package:kwik_client_flutter/widgets/custom_button_widget.dart';
import 'package:kwik_client_flutter/widgets/logo_widget.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    var isDark = ThemeUtils.isDark(context);
    double _getSpacer() {
      if (MediaQuery.of(context).size.height < 667) {
        return 15.0;
      } else if (MediaQuery.of(context).size.height >= 667 &&
          MediaQuery.of(context).size.height < 896) {
        return 25.0;
      } else {
        return 30.0;
      }
    }

    return Stack(
      children: <Widget>[
        Scaffold(
          body: Container(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            SizedBox(
                                height: MediaQuery.of(context).padding.top),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                LogoWidget(),
                              ],
                            ),
                            SizedBox(height: _getSpacer()),
                            Text(
                              'Olá',
                              style: GoogleFonts.sen(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -3,
                                fontSize: 32,
                              ),
                            ),
                            SizedBox(height: _getSpacer()),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  AuthIllustrationWidget(
                                      size: MediaQuery.of(context).size.width -
                                          48),
                                ],
                              ),
                            ),
                            SizedBox(height: _getSpacer()),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 48),
                              child: Column(
                                children: <Widget>[
                                  CustomButtonWidget(
                                    buttonFillType: ButtonFillType.FILLED,
                                    buttonType: ButtonType.DEFAULT,
                                    buttonText: 'Cadastro Rápido',
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/sign-up');
                                    },
                                  ),
                                  SizedBox(height: 20),
                                  CustomButtonWidget(
                                    buttonFillType: ButtonFillType.BORDER,
                                    buttonType: ButtonType.DEFAULT_ALTERNATIVE,
                                    buttonText: 'Entrar',
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/login');
                                    },
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: 140,
                                        height: 31.61290328,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                              isDark
                                                  ? 'assets/images/socials_dark.png'
                                                  : 'assets/images/socials_light.png',
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
