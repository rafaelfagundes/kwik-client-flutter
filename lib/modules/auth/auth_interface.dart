import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuth {
  Future getUser();
  Future<FirebaseUser> signInWithEmailAndPassword(
      String email, String password);
  Future googleSignIn();
  Future facebookSignIn();
  Future appleSignIn();
  Future<bool> passwordRecovery(String email);
  Future<bool> signOut();
}
