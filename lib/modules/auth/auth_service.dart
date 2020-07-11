import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:kwik_client_flutter/config/api_config.dart';
import 'package:kwik_client_flutter/modules/auth/auth_interface.dart';
import 'package:kwik_client_flutter/modules/auth/auth_response_dto.dart';
import 'package:kwik_client_flutter/modules/auth/auth_user_dto.dart';
import 'package:kwik_client_flutter/modules/auth/user_and_token_dto.dart';
import 'package:kwik_client_flutter/modules/user/user_model.dart';
import 'package:kwik_client_flutter/modules/user/user_response_dto.dart';
import 'package:kwik_client_flutter/modules/user/user_service.dart';

class AuthService implements IAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/user.phonenumbers.read',
      'https://www.googleapis.com/auth/user.birthday.read',
      'https://www.googleapis.com/auth/user.gender.read'
    ],
  );
  final FacebookLogin _facebookLogin = FacebookLogin();
  final UserService userService;
  AuthService({@required this.userService});

  Future<UserAndTokenDto> _getUserAndToken(
      String email, String accessToken, String type) async {
    try {
      String url = '${Api.baseUrl}/auth/sign-in';
      // print('chamando: $url');

      var response = await http.post(url, body: {
        'email': email,
        'secret': accessToken,
        'type': type,
      });

      switch (response.statusCode) {
        case 201:
          Map<String, dynamic> responseFromJson = json.decode(response.body);
          var user = User.fromJson(responseFromJson['user']);
          String token = responseFromJson['token'].toString();
          var userAndToken = UserAndTokenDto(
              user: user, token: token, status: response.statusCode);
          return userAndToken;
        case 404:
          var userAndToken = UserAndTokenDto(
              user: null, token: null, status: response.statusCode);
          return userAndToken;
        default:
          var userAndToken =
              UserAndTokenDto(user: null, token: null, status: 500);
          return userAndToken;
      }
    } catch (e) {
      print(e.toString());
      var userAndToken = UserAndTokenDto(user: null, token: null, status: 500);
      return userAndToken;
    }
  }

  @override
  Future<AuthResponseDto> appleSignIn() async {
    // TODO: implement appleSignIn
    throw UnimplementedError();
  }

  @override
  Future<AuthResponseDto> facebookSignIn() async {
    List<FacebookPermission> _permissions = [
      FacebookPermission.email,
      FacebookPermission.userGender,
      FacebookPermission.userBirthday,
      FacebookPermission.publicProfile
    ];
    final res = await _facebookLogin.logIn(permissions: _permissions);
    AuthResponseDto authResponse;

    switch (res.status) {
      case FacebookLoginStatus.Success:

        // Send access token to server for validation and auth
        final FacebookAccessToken accessToken = res.accessToken;
        print('Access token: ${accessToken.token}');

        // Get profile data
        final user = await _facebookLogin.getUserProfile();
        print('Hello, ${user.name}! You ID: ${user.userId}');

        // Get email (since we request email permission)
        final userEmail = await _facebookLogin.getUserEmail();

        // Get user profile image url
        final userImageUrl =
            await _facebookLogin.getProfileImageUrl(width: 100);
        print('Your profile image: $userImageUrl');

        // Sign In User With Kwik Server
        UserAndTokenDto userAndToken =
            await _getUserAndToken(userEmail, accessToken.token, 'FACEBOOK');

        // If User Exists
        if (userAndToken.status == 201) {
          authResponse = AuthResponseDto(
            user: userAndToken.user,
            status: AuthResponseStatus.OK,
            message: 'Usuário encontrado e logado',
            token: userAndToken.token,
          );
        }
        // If user doesn't exists
        else if (userAndToken.status == 404) {
          AuthUserDto authUser = AuthUserDto(
            firstName: user.firstName,
            lastName: user.lastName,
            email: userEmail,
            imageUrl: userImageUrl,
          );
          // Create new user
          UserResponseDto newUser = await userService.createUser(authUser);
          switch (newUser.status) {
            case UserResponseStatus.CREATED:
              // Sign In New User With Kwik Server
              UserAndTokenDto userAndToken = await _getUserAndToken(
                  userEmail, accessToken.token, 'FACEBOOK');
              if (userAndToken.status == 201) {
                authResponse = AuthResponseDto(
                  user: userAndToken.user,
                  status: AuthResponseStatus.OK,
                  message: 'Usuário encontrado e logado',
                  token: userAndToken.token,
                );
              } else {
                authResponse = AuthResponseDto(
                  user: null,
                  status: AuthResponseStatus.ERROR,
                  message: 'Não foi possível criar um novo usuário',
                  token: null,
                );
              }
              break;
            case UserResponseStatus.ERROR:
              authResponse = AuthResponseDto(
                user: null,
                status: AuthResponseStatus.ERROR,
                message: 'Usuário não encontrado',
                token: null,
              );
              break;
            default:
              break;
          }
        } else {
          authResponse = AuthResponseDto(
            user: null,
            status: AuthResponseStatus.ERROR,
            message:
                'Erro ao cadastrar novo usuário. Tente novamente mais tarde.',
            token: null,
          );
        }
        break;
      case FacebookLoginStatus.Cancel:
        authResponse = AuthResponseDto(
          user: null,
          status: AuthResponseStatus.CANCELLED,
          message: 'Usuário cancelou login',
          token: null,
        );
        break;
      case FacebookLoginStatus.Error:
        authResponse = AuthResponseDto(
          user: null,
          status: AuthResponseStatus.ERROR,
          message: 'Erro ao logar com Facebook',
          token: null,
        );
        break;
      default:
        authResponse = AuthResponseDto(
          user: null,
          status: AuthResponseStatus.ERROR,
          message: 'Erro ao logar com Facebook',
          token: null,
        );
        break;
    }

    return authResponse;
  }

  @override
  Future<AuthResponseDto> googleSignIn() async {
    try {
      GoogleSignInAccount user = await _googleSignIn.signIn();
      String token = (await user.authentication).idToken;
      AuthResponseDto authResponse;

      UserAndTokenDto userAndToken =
          await _getUserAndToken(user.email, token, 'GOOGLE');

      // If user exists
      if (userAndToken.status == 201) {
        authResponse = AuthResponseDto(
          user: userAndToken.user,
          status: AuthResponseStatus.OK,
          message: 'Usuário encontrado e logado',
          token: userAndToken.token,
        );
      }
      // If user doesn't exists
      else if (userAndToken.status == 404) {
        AuthUserDto authUser = AuthUserDto(
          firstName: user.displayName.split(' ')[0],
          lastName: user.displayName.split(' ')[1],
          email: user.email,
          imageUrl: user.photoUrl,
        );
        // Create new user
        UserResponseDto newUser = await userService.createUser(authUser);
        switch (newUser.status) {
          case UserResponseStatus.CREATED:
            // Sign In New User With Kwik Server
            UserAndTokenDto userAndToken =
                await _getUserAndToken(user.email, token, 'GOOGLE');
            if (userAndToken.status == 201) {
              authResponse = AuthResponseDto(
                user: userAndToken.user,
                status: AuthResponseStatus.OK,
                message: 'Usuário encontrado e logado',
                token: userAndToken.token,
              );
            } else {
              authResponse = AuthResponseDto(
                user: null,
                status: AuthResponseStatus.ERROR,
                message: 'Não foi possível criar um novo usuário',
                token: null,
              );
            }
            break;
          case UserResponseStatus.ERROR:
            authResponse = AuthResponseDto(
              user: null,
              status: AuthResponseStatus.ERROR,
              message: 'Usuário não encontrado',
              token: null,
            );
            break;
          default:
            break;
        }
      } else {
        authResponse = AuthResponseDto(
          user: null,
          status: AuthResponseStatus.ERROR,
          message:
              'Erro ao cadastrar novo usuário. Tente novamente mais tarde.',
          token: null,
        );
      }

      return authResponse;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  @override
  Future<AuthResponseDto> signInWithEmailAndPassword(email, password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      IdTokenResult idToken = await result.user.getIdToken(refresh: true);

      UserAndTokenDto userAndToken =
          await _getUserAndToken(email, idToken.token, 'GOOGLE');

      inspect(userAndToken);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      await _auth.signOut();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  Future<bool> passwordRecovery(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
