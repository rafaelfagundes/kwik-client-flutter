import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:kwik_client_flutter/controllers/app_controller.dart';
import 'package:kwik_client_flutter/widgets/header_widget.dart';

enum THEME {
  NIGHT_IDLE,
  DAY_IDLE,
  SWITCH_NIGHT,
  SWITCH_DAY,
}

class Settings extends StatefulWidget {
  Settings({
    Key key,
  }) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final FlareControls _controls = FlareControls();
  static const _animations = [
    'night_idle',
    'day_idle',
    'switch_night',
    'switch_day'
  ];
  String _currentThemeAnimation = AppController.instance.themeSwitch.value
      ? _animations[0]
      : _animations[1]; // TODO: [Rafael] get from system or saved preferences
  // String _currentThemeAnimation = _animations[0];

  void _handleThemeSwitch() {
    if (_currentThemeAnimation == 'day_idle') {
      AppController.instance.changeTheme(true);
      _controls.play(_animations[THEME.SWITCH_NIGHT.index]);
      setState(() {
        _currentThemeAnimation = _animations[THEME.NIGHT_IDLE.index];
      });
    } else {
      AppController.instance.changeTheme(false);
      _controls.play(_animations[THEME.SWITCH_DAY.index]);
      setState(() {
        _currentThemeAnimation = _animations[THEME.DAY_IDLE.index];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Header('Ajustes'),
            // UserInfo
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        width: 48.0,
                        height: 48.0,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(24.0, 24.0)),
                          image: DecorationImage(
                            image: const AssetImage('assets/images/Avatar.jpg'),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0x0d000000),
                              offset: Offset(0, 4),
                              blurRadius: 8,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Michael Scott',
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 18,
                            color: Theme.of(context).primaryColor,
                            letterSpacing: 0.0045000000000000005,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          'Editar perfil, senha, imagem',
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 14,
                            color: Theme.of(context).primaryColor,
                            letterSpacing: 0.0035,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ])
                ],
              ),
            ),
            SizedBox(
              height: 26,
            ),
            // SelectedCity
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.only(left: 10),
              width: double.infinity,
              height: 60.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Theme.of(context).cardColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        SFSymbols.location_fill,
                        color: Theme.of(context).primaryColor,
                        size: 28,
                      ),
                      SizedBox(width: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Mostrando locais de',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 12,
                              color: Theme.of(context).primaryColor,
                              letterSpacing: 0.003,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 2),
                          Text(
                            'São João del Rei, MG',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 14,
                              color: Theme.of(context).primaryColor,
                              letterSpacing: 0.0035,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                        onPressed: null,
                        child: Text(
                          'Alterar',
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 14,
                            color: Theme.of(context).accentColor,
                            letterSpacing: 0.0035,
                            // fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 50,
              child: Row(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(SFSymbols.map,
                          size: 28, color: Theme.of(context).primaryColor),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Meus Endereços',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 16,
                          color: Theme.of(context).primaryColor,
                          letterSpacing: 0.004,
                        ),
                        textAlign: TextAlign.left,
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 50,
              child: Row(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(SFSymbols.heart,
                          size: 28, color: Theme.of(context).primaryColor),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Meus Favoritos',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 16,
                          color: Theme.of(context).primaryColor,
                          letterSpacing: 0.004,
                        ),
                        textAlign: TextAlign.left,
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 50,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(SFSymbols.tag,
                          size: 28, color: Theme.of(context).primaryColor),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Meus Cupons',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 16,
                          color: Theme.of(context).primaryColor,
                          letterSpacing: 0.004,
                        ),
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                    child: Text(
                      '8',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 12),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(24.0, 24.0)),
                        border: Border.all(color: Colors.white, width: 2)),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(SFSymbols.circle_lefthalf_fill,
                          size: 28, color: Theme.of(context).primaryColor),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Tema',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 16,
                          color: Theme.of(context).primaryColor,
                          letterSpacing: 0.004,
                        ),
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                  // Switch.adaptive(value: false, onChanged: null)
                  GestureDetector(
                    onTap: _handleThemeSwitch,
                    child: Container(
                      height: 100,
                      width: 60,
                      child: FlareActor(
                        'assets/animations/switch_daytime.flr',
                        animation: _currentThemeAnimation,
                        fit: BoxFit.contain,
                        controller: _controls,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 50,
              child: Row(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(SFSymbols.question_circle,
                          size: 28, color: Theme.of(context).primaryColor),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Ajuda',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 16,
                          color: Theme.of(context).primaryColor,
                          letterSpacing: 0.004,
                        ),
                        textAlign: TextAlign.left,
                      )
                    ],
                  )
                ],
              ),
            ),

            Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(SFSymbols.escape,
                          size: 28, color: Theme.of(context).primaryColor),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Sair',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 16,
                          color: Theme.of(context).primaryColor,
                          letterSpacing: 0.004,
                        ),
                        textAlign: TextAlign.left,
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 32,
            ),
          ],
        ),
      ),
    ));
  }
}
