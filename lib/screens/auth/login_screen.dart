import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/modules/auth/auth_controller.dart';
import 'package:kwik_client_flutter/modules/auth/auth_service.dart';
import 'package:kwik_client_flutter/shared/enums.dart';
import 'package:kwik_client_flutter/widgets/custom_alert_dialog.dart';
import 'package:kwik_client_flutter/widgets/custom_button_widget.dart';
import 'package:kwik_client_flutter/widgets/custom_text_field.dart';
import 'package:kwik_client_flutter/widgets/default_screen_widget.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController =
      TextEditingController(text: 'rafael@usuario.com.br');
  final TextEditingController _passwordController =
      TextEditingController(text: '123456');

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AuthController auth = AuthController(AuthService());

    return DefaultScreen(
      'Entrar',
      children: <Widget>[
        SizedBox(height: 16.0),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: CustomTextField(
            labelText: 'Email',
            controller: _emailController,
          ),
        ),
        SizedBox(height: 16),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: CustomTextField(
            labelText: 'Senha',
            controller: _passwordController,
          ),
        ),
        SizedBox(height: 32.0),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: CustomButtonWidget(
            buttonText: 'Entrar',
            onPressed: () async {
              var result = await auth.signInWithEmailAndPassword(
                  _emailController.text, _passwordController.text);
              if (result != null) {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/', (route) => false);
              } else {
                CustomAlertDialog.showDialog(
                  context,
                  title: 'Não Foi Possível Entrar',
                  content:
                      'Usuário e/ou senha não encontrados.\n\nCaso não possua cadastro, faça um, é rapidinho.',
                );
              }
            },
          ),
        ),
        SizedBox(height: 16.0),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: CustomButtonWidget(
            buttonFillType: ButtonFillType.EMPTY,
            buttonType: ButtonType.DEFAULT_ALTERNATIVE,
            buttonText: 'Esqueci Minha Senha',
            onPressed: () {
              Navigator.pushNamed(context, '/forgotten-password');
            },
          ),
        )
      ],
    );
  }
}
