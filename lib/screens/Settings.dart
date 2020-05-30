import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';

import '../widgets/Header.dart';

class Settings extends StatelessWidget {
  Settings({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Header('Ajustes', false, false, null, null),
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
                              image:
                                  const AssetImage('assets/images/Avatar.jpg'),
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
                              color: const Color(0xff440044),
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
                              color: const Color(0xff440044),
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
                  color: const Color(0xffa1e8af),
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
                                color: const Color(0xff440044),
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
                                color: const Color(0xff440044),
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
                              color: const Color(0xff800080),
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
                height: 26,
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
                            color: const Color(0xff440044),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(SFSymbols.moon_circle,
                            size: 28, color: Theme.of(context).primaryColor),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Modo Escuro',
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 16,
                            color: const Color(0xff440044),
                            letterSpacing: 0.004,
                          ),
                          textAlign: TextAlign.left,
                        )
                      ],
                    ),
                    Switch.adaptive(value: false, onChanged: null)
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
                            color: const Color(0xff440044),
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
                            color: const Color(0xff440044),
                            letterSpacing: 0.004,
                          ),
                          textAlign: TextAlign.left,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
