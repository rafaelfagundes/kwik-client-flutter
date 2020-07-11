import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/modules/auth/auth_controller.dart';
import 'package:kwik_client_flutter/modules/auth/auth_response_dto.dart';
import 'package:kwik_client_flutter/modules/auth/auth_service.dart';
import 'package:kwik_client_flutter/modules/auth/auth_store.dart';
import 'package:kwik_client_flutter/modules/user/user_controller.dart';
import 'package:kwik_client_flutter/modules/user/user_service.dart';
import 'package:kwik_client_flutter/shared/enums.dart';
import 'package:kwik_client_flutter/utils/validation.dart';
import 'package:kwik_client_flutter/widgets/custom_alert_dialog.dart';
import 'package:kwik_client_flutter/widgets/custom_button_widget.dart';
import 'package:kwik_client_flutter/widgets/custom_text_field.dart';
import 'package:kwik_client_flutter/widgets/default_screen_widget.dart';
import 'package:kwik_client_flutter/widgets/full_screen_loading_widget.dart';
import 'package:kwik_client_flutter/widgets/section_subtitle_widget.dart';
import 'package:provider/provider.dart';

import 'social_sign_in_buttons_widget.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController =
      TextEditingController(text: 'rafael@usuario.com');
  final TextEditingController _passwordController =
      TextEditingController(text: '123456');

  bool loading = false;

  static const Map<String, dynamic> errorsTemplate = {
    "email": null,
    "password": null,
  };

  Map<String, dynamic> errors = Map.from(errorsTemplate);

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool _validate() {
    var _errorsCopy = Map.from(errorsTemplate);
    int _errorsCount = 0;

    // Email
    if (!Validation.isValidEmail(_emailController.text)) {
      _errorsCount++;
      _errorsCopy['email'] = 'Por favor, insira um email válido';
    }
    if (_emailController.text.isEmpty) {
      _errorsCount++;
      _errorsCopy['email'] = 'Por favor, preencha o email';
    }

    // Password
    if (_passwordController.text.length < 6) {
      _errorsCount++;
      _errorsCopy['password'] = 'A senha deve conter no mínimo 6 caracteres';
    }
    if (_passwordController.text.isEmpty) {
      _errorsCount++;
      _errorsCopy['password'] = 'Por favor, preencha a senha';
    }

    setState(() {
      errors = Map.from(_errorsCopy);
    });
    if (_errorsCount > 0) {
      return false;
    } else {
      return true;
    }
  }

  void _login(AuthController authController, AuthStore authStore) async {
    if (!_validate()) {
      return;
    }
    setState(() {
      loading = true;
    });
    AuthResponseDto response = await authController.signInWithEmailAndPassword(
        _emailController.text, _passwordController.text);
    if (response != null) {
      setState(() {
        loading = false;
      });

      // Save in application state
      authStore.setUser(response.user);
      authStore.setIsLogged(true);

      Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
    } else {
      setState(() {
        loading = false;
      });
      CustomAlertDialog.showDialog(
        context,
        title: 'Não Foi Possível Entrar',
        content: 'Usuário e/ou senha não encontrados.',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    AuthController authController = AuthController(
        AuthService(userService: UserService()),
        UserController(userService: UserService()));
    var authStore = Provider.of<AuthStore>(context);

    return Stack(
      children: <Widget>[
        DefaultScreen(
          'Entrar',
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: SectionSubTitle('Entre com os serviços'),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SocialSignInButtonsWidget(
                authController: authController,
              ),
            ),
            SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: SectionSubTitle('Ou através de seu email e senha'),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: CustomTextField(
                textCapitalization: TextCapitalization.none,
                labelText: 'Email',
                controller: _emailController,
                errorText: errors['email'],
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: CustomTextField(
                labelText: 'Senha',
                controller: _passwordController,
                errorText: errors['password'],
                obscureText: true,
                onEditingComplete: () => _login(authController, authStore),
                textInputAction: TextInputAction.go,
              ),
            ),
            SizedBox(height: 32.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomButtonWidget(
                buttonText: 'Entrar',
                onPressed: () => _login(authController, authStore),
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
        ),
        if (loading) FullScreenLoadingWidget()
      ],
    );
  }
}
