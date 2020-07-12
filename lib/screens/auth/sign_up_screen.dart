import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/modules/auth/auth_controller.dart';
import 'package:kwik_client_flutter/modules/auth/auth_response_dto.dart';
import 'package:kwik_client_flutter/modules/auth/auth_service.dart';
import 'package:kwik_client_flutter/modules/auth/auth_store.dart';
import 'package:kwik_client_flutter/modules/auth/auth_user_dto.dart';
import 'package:kwik_client_flutter/modules/user/user_controller.dart';
import 'package:kwik_client_flutter/modules/user/user_response_dto.dart';
import 'package:kwik_client_flutter/modules/user/user_service.dart';
import 'package:kwik_client_flutter/screens/auth/social_sign_in_buttons_widget.dart';
import 'package:kwik_client_flutter/utils/validation.dart';
import 'package:kwik_client_flutter/widgets/custom_alert_dialog.dart';
import 'package:kwik_client_flutter/widgets/custom_button_widget.dart';
import 'package:kwik_client_flutter/widgets/custom_text_field.dart';
import 'package:kwik_client_flutter/widgets/default_screen_widget.dart';
import 'package:kwik_client_flutter/widgets/full_screen_loading_widget.dart';
import 'package:kwik_client_flutter/widgets/section_subtitle_widget.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  static const Map<String, dynamic> errorsTemplate = {
    "firstName": null,
    "lastName": null,
    "email": null,
    "password": null,
  };

  bool loading = false;

  Map<String, dynamic> errors = Map.from(errorsTemplate);

  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  final userController = UserController(userService: UserService());
  final authController = AuthController(
    authService: AuthService(userService: UserService()),
    userController: UserController(
      userService: UserService(),
    ),
  );

  @override
  void dispose() {
    firstName.dispose();
    lastName.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  bool _validate() {
    var _errorsCopy = Map.from(errorsTemplate);
    int _errorsCount = 0;

    // FirstName
    if (firstName.text.length < 2) {
      print('firstName');
      _errorsCount++;
      _errorsCopy['firstName'] = 'O nome deve conter no mínimo 2 caracteres';
    }
    if (firstName.text.isEmpty) {
      _errorsCount++;
      _errorsCopy['firstName'] = 'Por favor, preencha o nome';
    }

    // LastName
    if (lastName.text.length < 2) {
      _errorsCount++;
      _errorsCopy['lastName'] =
          'O sobrenome deve conter no mínimo 2 caracteres';
    }
    if (lastName.text.isEmpty) {
      _errorsCount++;
      _errorsCopy['lastName'] = 'Por favor, preencha o sobrenome';
    }

    // Email
    if (!Validation.isValidEmail(email.text)) {
      _errorsCount++;
      _errorsCopy['email'] = 'Por favor, insira um email válido';
    }
    if (email.text.isEmpty) {
      _errorsCount++;
      _errorsCopy['email'] = 'Por favor, preencha o email';
    }

    // Password
    if (password.text.length < 6) {
      _errorsCount++;
      _errorsCopy['password'] = 'A senha deve conter no mínimo 6 caracteres';
    }
    if (password.text.isEmpty) {
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

  void _signUp(AuthStore authStore) async {
    setState(() {
      loading = true;
    });
    if (!_validate()) {
      setState(() {
        loading = false;
      });
      return;
    }

    var newUser = AuthUserDto(
      firstName: firstName.text,
      lastName: lastName.text,
      email: email.text,
      password: password.text,
    );

    UserResponseDto user =
        await userController.createUserWithEmailAndPassword(newUser);

    switch (user.status) {
      case UserResponseStatus.CREATED:
        // Save in application state
        AuthResponseDto response = await authController
            .signInWithEmailAndPassword(email.text, password.text);

        if (response.status == AuthResponseStatus.OK) {
          authStore.setToken(response.token);
          authStore.setUser(user.user);
          authStore.setIsLogged(true);
          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        } else {
          setState(() {
            loading = false;
          });
          CustomAlertDialog.showDialog(context,
              title: 'Erro', content: user.message);
          break;
        }

        break;
      case UserResponseStatus.ALREADY_EXISTS:
        setState(() {
          loading = false;
        });
        CustomAlertDialog.showDialog(context,
            title: 'Erro', content: user.message);
        break;
      case UserResponseStatus.ERROR:
        setState(() {
          loading = false;
        });
        CustomAlertDialog.showDialog(context,
            title: 'Erro', content: user.message);
        break;
      default:
        setState(() {
          loading = false;
        });
        CustomAlertDialog.showDialog(context,
            title: 'Erro', content: user.message);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    AuthController authController = AuthController(
        authService: AuthService(userService: UserService()),
        userController: UserController(userService: UserService()));
    var authStore = Provider.of<AuthStore>(context);

    return Stack(
      children: <Widget>[
        Container(
          child: DefaultScreen('Cadastrar', children: [
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
              child: SectionSubTitle('Ou cadastre-se com email e senha'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 16),
                  CustomTextField(
                    labelText: 'Nome',
                    controller: firstName,
                    errorText: errors['firstName'],
                  ),
                  SizedBox(height: 16),
                  CustomTextField(
                    labelText: 'Sobrenome',
                    controller: lastName,
                    errorText: errors['lastName'],
                  ),
                  SizedBox(height: 16),
                  CustomTextField(
                    labelText: 'Email',
                    controller: email,
                    errorText: errors['email'],
                    keyboardType: TextInputType.emailAddress,
                    textCapitalization: TextCapitalization.none,
                  ),
                  SizedBox(height: 16),
                  CustomTextField(
                    labelText: 'Senha',
                    controller: password,
                    errorText: errors['password'],
                    obscureText: true,
                    onEditingComplete: () => _signUp(authStore),
                    textInputAction: TextInputAction.go,
                  ),
                  SizedBox(height: 32),
                  CustomButtonWidget(
                    buttonText: 'Cadastrar',
                    onPressed: () => _signUp(authStore),
                  )
                ],
              ),
            ),
          ]),
        ),
        if (loading) FullScreenLoadingWidget()
      ],
    );
  }
}
