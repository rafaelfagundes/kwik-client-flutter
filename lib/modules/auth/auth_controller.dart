import 'package:flutter/foundation.dart';
import 'package:kwik_client_flutter/modules/auth/auth_response_dto.dart';
import 'package:kwik_client_flutter/modules/auth/auth_service.dart';
import 'package:kwik_client_flutter/modules/user/user_controller.dart';

class AuthController {
  final AuthService authService;
  final UserController userController;
  AuthController({@required this.authService, @required this.userController});

  Future<AuthResponseDto> signInWithEmailAndPassword(
      String email, String password) async {
    return await this.authService.signInWithEmailAndPassword(email, password);
  }

  Future<AuthResponseDto> googleSignIn() async {
    return await this.authService.googleSignIn();
  }

  Future<AuthResponseDto> facebookSignIn() async {
    return await this.authService.facebookSignIn();
  }

  Future<bool> passwordRecovery(String email) async {
    return await this.authService.passwordRecovery(email);
  }
}
