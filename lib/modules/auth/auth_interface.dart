import 'package:kwik_client_flutter/modules/auth/auth_response_dto.dart';

abstract class IAuth {
  Future<AuthResponseDto> signInWithEmailAndPassword(
      String email, String password);
  Future<AuthResponseDto> googleSignIn();
  Future<AuthResponseDto> facebookSignIn();
  Future<AuthResponseDto> appleSignIn();
  Future<bool> passwordRecovery(String email);
  Future<bool> signOut();
}
