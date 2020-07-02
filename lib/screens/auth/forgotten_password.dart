import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/modules/auth/auth_controller.dart';
import 'package:kwik_client_flutter/modules/auth/auth_service.dart';
import 'package:kwik_client_flutter/widgets/custom_alert_dialog.dart';
import 'package:kwik_client_flutter/widgets/custom_button_widget.dart';
import 'package:kwik_client_flutter/widgets/custom_text_field.dart';
import 'package:kwik_client_flutter/widgets/default_screen_widget.dart';

class ForgottenPasswordScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthController auth = AuthController(AuthService());

    return DefaultScreen('Recuperar Senha', children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          'Informe abaixo o email utilizado no momento do cadastro',
          style: TextStyle(
              fontSize: 12,
              fontFamily: 'Lato',
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.normal),
        ),
      ),
      SizedBox(height: 24),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomTextField(
          controller: _emailController,
          labelText: 'Email',
        ),
      ),
      SizedBox(height: 32),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomButtonWidget(
          buttonText: 'Recuperar Senha',
          onPressed: () async {
            var result = await auth.passwordRecovery(_emailController.text);
            if (result) {
              CustomAlertDialog.showDialog(context,
                  title: 'Verifique Seu Email',
                  content:
                      'As instruções para redefinir sua senha foram enviadas para o email informado');
              // _showOKDialog(context);
            } else {
              CustomAlertDialog.showDialog(context,
                  title: 'Erro',
                  content:
                      'Não foi possível enviar o email de recuperação.\n\nVerifique se o email está correto.');
              // _showErrorDialog(context);
            }
          },
        ),
      )
    ]);
  }
}
