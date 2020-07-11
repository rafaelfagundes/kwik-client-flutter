import 'package:kwik_client_flutter/modules/auth/auth_response_dto.dart';
import 'package:kwik_client_flutter/modules/auth/auth_service.dart';
import 'package:kwik_client_flutter/modules/user/user_controller.dart';

class AuthController {
  final AuthService authService;
  final UserController userController;
  AuthController(this.authService, this.userController);

  Future<AuthResponseDto> signInWithEmailAndPassword(
      String email, String password) async {
    AuthResponseDto response =
        await this.authService.signInWithEmailAndPassword(email, password);

    // if (response != null) {
    //   // User user = await userController.getUserByEmail(response.email);
    //   if (user != null) {
    //     return user;
    //   } else
    //     return null;
    // } else {
    //   return null;
    // }
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
