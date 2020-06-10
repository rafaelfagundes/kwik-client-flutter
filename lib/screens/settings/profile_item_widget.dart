import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/widgets/rounded_avatar_widget.dart';

class ProfileItemWidget extends StatelessWidget {
  const ProfileItemWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, "/profile");
        },
        child: Container(
          color: Colors.transparent,
          child: Row(
            children: <Widget>[
              Row(
                children: <Widget>[
                  RoundedAvatarWidget(
                    size: 56,
                    url:
                        'https://s3.amazonaws.com/uifaces/faces/twitter/alessandroribe/128.jpg',
                    animationDuration: 100,
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
      ),
    );
  }
}