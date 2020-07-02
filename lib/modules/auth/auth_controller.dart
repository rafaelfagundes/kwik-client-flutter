import 'package:firebase_auth/firebase_auth.dart';
import 'package:kwik_client_flutter/modules/auth/auth_interface.dart';
import 'package:kwik_client_flutter/modules/auth/user_model.dart';
import 'package:kwik_client_flutter/shared/enums.dart';

class AuthController {
  final IAuth auth;
  AuthController(this.auth);

  Future<User> signInWithEmailAndPassword(String email, String password) async {
    FirebaseUser result =
        await this.auth.signInWithEmailAndPassword(email, password);

    if (result != null) {
      var user = User(
        id: result.uid,
        firstName: result.displayName.split(' ')[0],
        lastName: result.displayName.split(' ')[1],
        email: result.email,
        gender: Gender.OTHER,
        phoneNumber: result.phoneNumber,
      );
      return user;
    } else {
      return null;
    }
  }

  Future<bool> passwordRecovery(String email) async {
    return await this.auth.passwordRecovery(email);
  }
}
