import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kwik_client_flutter/modules/auth/auth_interface.dart';
import 'package:kwik_client_flutter/modules/auth/user_model.dart';
import 'package:kwik_client_flutter/shared/enums.dart';

class AuthController {
  final IAuth authService;
  AuthController(this.authService);

  Future<User> signInWithEmailAndPassword(String email, String password) async {
    FirebaseUser result =
        await this.authService.signInWithEmailAndPassword(email, password);

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

  Future<User> googleSignIn() async {
    GoogleSignInAccount result = await authService.googleSignIn();

    if (result != null) {
      var user = User(
          id: result.id,
          firstName: result.displayName.split(' ')[0],
          lastName: result.displayName.split(' ')[1],
          email: result.email,
          gender: Gender.OTHER,
          avatarUrl: result.photoUrl);
      return user;
    } else {
      return null;
    }
  }

  Future<User> facebookSignIn() async {
    Map<String, dynamic> result = await authService.facebookSignIn();
    if (result['cancelledByUser']) {
      // I had to do this to differentiate when the user canceled or when it was an error
      var user = User(
        id: 'cancelledByUser',
        firstName: '',
        lastName: '',
        email: '',
        gender: Gender.OTHER,
      );
      return user;
    } else if (result != null) {
      var user = User(
          id: result['id'],
          firstName: result['first_name'],
          lastName: result['last_name'],
          email: result['email'],
          gender: Gender.OTHER,
          avatarUrl: result['picture']['data']['url']);
      return user;
    } else {
      return null;
    }
  }

  Future<bool> passwordRecovery(String email) async {
    return await this.authService.passwordRecovery(email);
  }
}
