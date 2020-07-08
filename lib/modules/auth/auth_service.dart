import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:kwik_client_flutter/modules/auth/auth_interface.dart';

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

  @override
  Future appleSignIn() async {
    // TODO: implement appleSignIn
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> facebookSignIn() async {
    List<String> permissions = [
      'email',
      'user_gender',
      'user_birthday',
      'public_profile',
    ];
    var result = await _facebookLogin.logIn(permissions);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final token = result.accessToken.token;
        final graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email,picture.height(256)&access_token=$token');
        Map<String, dynamic> profile = json.decode(graphResponse.body);
        profile['cancelledByUser'] = false;
        return profile;
      case FacebookLoginStatus.cancelledByUser:
        return {'cancelledByUser': true};
      case FacebookLoginStatus.error:
        return null;
      default:
        return null;
    }
  }

  @override
  Future getUser() {
    return _auth.currentUser();
  }

  @override
  Future<GoogleSignInAccount> googleSignIn() async {
    try {
      GoogleSignInAccount user = await _googleSignIn.signIn();
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  @override
  Future<FirebaseUser> signInWithEmailAndPassword(email, password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return user;
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
