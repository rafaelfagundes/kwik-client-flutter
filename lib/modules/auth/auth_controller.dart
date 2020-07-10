import 'package:kwik_client_flutter/modules/auth/auth_response_dto.dart';
import 'package:kwik_client_flutter/modules/auth/auth_service.dart';
import 'package:kwik_client_flutter/modules/auth/auth_user_dto.dart';
import 'package:kwik_client_flutter/modules/user/user_controller.dart';
import 'package:kwik_client_flutter/modules/user/user_model.dart';
import 'package:kwik_client_flutter/modules/user/user_response_dto.dart';

class AuthController {
  final AuthService authService;
  final UserController userController;
  AuthController(this.authService, this.userController);

  Future<User> signInWithEmailAndPassword(String email, String password) async {
    AuthUserDto result =
        await this.authService.signInWithEmailAndPassword(email, password);

    if (result != null) {
      User user = await userController.getUserByEmail(result.email);
      if (user != null) {
        return user;
      } else
        return null;
    } else {
      return null;
    }
  }

  Future<User> googleSignIn() async {
    AuthUserDto result = await this.authService.googleSignIn();

    if (result != null) {
      User user = await this.userController.getUserByEmail(result.email);
      if (user != null) {
        return user;
      } else {
        UserResponseDto response = await this.userController.createUser(result);
        return response.user;
      }
    } else {
      return null;
    }
  }

  Future<AuthResponseDto> facebookSignIn() async {
    AuthUserDto result = await this.authService.facebookSignIn();

    if (result.isCancelled) {
      print('Usuário cancelou o login');
      var authResponse = AuthResponseDto(
        user: null,
        status: AuthResponseStatus.CANCELLED,
        message: 'Usuário cancelou o login',
      );
      return authResponse;
    } else if (result != null) {
      User user = await this.userController.getUserByEmail(result.email);
      if (user == null) {
        UserResponseDto response = await this.userController.createUser(result);
        switch (response.status) {
          case UserResponseStatus.CREATED:
            print('Usuário criado');
            var authResponse = AuthResponseDto(
              user: response.user,
              status: AuthResponseStatus.OK,
              message: 'Usuário criado',
            );
            return authResponse;
            break;
          case UserResponseStatus.ERROR:
            print('Erro ao criar usuário');
            var authResponse = AuthResponseDto(
              user: null,
              status: AuthResponseStatus.ERROR,
              message: 'Erro ao criar usuário',
            );
            return authResponse;
            break;
          default:
            print('Erro ao criar usuário');
            var authResponse = AuthResponseDto(
              user: null,
              status: AuthResponseStatus.ERROR,
              message: 'Erro ao criar usuário',
            );
            return authResponse;
            break;
        }
      } else {
        print('Usuário encontrado');
        var authResponse = AuthResponseDto(
          user: user,
          status: AuthResponseStatus.OK,
          message: 'Usuário encontrado',
        );
        return authResponse;
      }
    }
  }

  Future<bool> passwordRecovery(String email) async {
    return await this.authService.passwordRecovery(email);
  }
}
