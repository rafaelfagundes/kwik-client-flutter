import 'package:kwik_client_flutter/modules/auth/auth_user_dto.dart';

abstract class IAuth {
  Future getUser();
  Future<AuthUserDto> signInWithEmailAndPassword(String email, String password);
  Future<AuthUserDto> googleSignIn();
  Future<AuthUserDto> facebookSignIn();
  Future<AuthUserDto> appleSignIn();
  Future<bool> passwordRecovery(String email);
  Future<bool> signOut();
}
