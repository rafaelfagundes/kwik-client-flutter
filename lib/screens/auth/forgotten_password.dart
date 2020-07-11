import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/modules/auth/auth_controller.dart';
import 'package:kwik_client_flutter/modules/auth/auth_service.dart';
import 'package:kwik_client_flutter/modules/user/user_controller.dart';
import 'package:kwik_client_flutter/modules/user/user_service.dart';
import 'package:kwik_client_flutter/utils/validation.dart';
import 'package:kwik_client_flutter/widgets/custom_alert_dialog.dart';
import 'package:kwik_client_flutter/widgets/custom_button_widget.dart';
import 'package:kwik_client_flutter/widgets/custom_text_field.dart';
import 'package:kwik_client_flutter/widgets/default_screen_widget.dart';

class ForgottenPasswordScreen extends StatefulWidget {
  @override
  _ForgottenPasswordScreenState createState() =>
      _ForgottenPasswordScreenState();
}

class _ForgottenPasswordScreenState extends State<ForgottenPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  static const Map<String, dynamic> errorsTemplate = {
    "email": null,
  };

  Map<String, dynamic> errors = Map.from(errorsTemplate);

  bool _validate() {
    var _errorsCopy = errors;
    int _errorsCount = 0;

    print(_emailController.text);

    // Email
    if (!Validation.isValidEmail(_emailController.text)) {
      _errorsCount++;
      _errorsCopy['email'] = 'Por favor, insira um email válido';
    }
    if (_emailController.text.isEmpty) {
      _errorsCount++;
      _errorsCopy['email'] = 'Por favor, preencha o email';
    }

    if (_errorsCount > 0) {
      setState(() {
        errors = _errorsCopy;
      });
      return false;
    } else {
      setState(() {
        errors = Map.from(errorsTemplate);
      });
      return true;
    }
  }

  void _send(AuthController authController) async {
    if (!_validate()) {
      return;
    }
    var result = await authController.passwordRecovery(_emailController.text);
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
  }

  @override
  Widget build(BuildContext context) {
    AuthController authController = AuthController(
        AuthService(userService: UserService()),
        UserController(userService: UserService()));

    return DefaultScreen('Recuperar Senha', children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          'Informe abaixo o email utilizado no momento do cadastro',
          style: TextStyle(
            fontSize: 12,
            fontFamily: 'Lato',
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      SizedBox(height: 24),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomTextField(
          controller: _emailController,
          labelText: 'Email',
          errorText: errors['email'],
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.go,
          textCapitalization: TextCapitalization.none,
        ),
      ),
      SizedBox(height: 32),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomButtonWidget(
            buttonText: 'Recuperar Senha',
            onPressed: () => _send(authController)),
      )
    ]);
  }
}
