import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kwik_client_flutter/modules/auth/auth_interface.dart';
import 'package:kwik_client_flutter/modules/auth/auth_user_dto.dart';

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
  Future getUser() {
    return _auth.currentUser();
  }

  @override
  Future<AuthUserDto> appleSignIn() async {
    // TODO: implement appleSignIn
    throw UnimplementedError();
  }

  @override
  Future<AuthUserDto> facebookSignIn() async {
    List<FacebookPermission> _permissions = [
      FacebookPermission.email,
      FacebookPermission.userGender,
      FacebookPermission.userBirthday,
      FacebookPermission.publicProfile
    ];
    final res = await _facebookLogin.logIn(permissions: _permissions);

    switch (res.status) {
      case FacebookLoginStatus.Success:

        // Send access token to server for validation and auth
        final FacebookAccessToken accessToken = res.accessToken;
        print('Access token: ${accessToken.token}');

        // Get profile data
        final user = await _facebookLogin.getUserProfile();
        print('Hello, ${user.name}! You ID: ${user.userId}');

        // Get email (since we request email permission)
        final email = await _facebookLogin.getUserEmail();

        // Get user profile image url
        final imageUrl = await _facebookLogin.getProfileImageUrl(width: 100);
        print('Your profile image: $imageUrl');

        AuthUserDto authUserDto = AuthUserDto(
          firstName: user.firstName,
          lastName: user.lastName,
          email: email,
          accessToken: accessToken.token,
          imageUrl: imageUrl,
        );

        return authUserDto;
      case FacebookLoginStatus.Cancel:
        AuthUserDto authUserDto = AuthUserDto(
          firstName: null,
          lastName: null,
          email: null,
          accessToken: null,
          isCancelled: true,
        );

        return authUserDto;
      case FacebookLoginStatus.Error:
        return null;
      default:
        return null;
    }
  }

  @override
  Future<AuthUserDto> googleSignIn() async {
    try {
      GoogleSignInAccount user = await _googleSignIn.signIn();
      GoogleSignInAuthentication authentication = await user.authentication;
      String token = authentication.accessToken;
      print('token $token');

      AuthUserDto authUserDto = AuthUserDto(
        firstName: user.displayName.split(' ')[0],
        lastName: user.displayName.split(' ')[1],
        email: user.email,
        accessToken: token,
        imageUrl: user.photoUrl,
      );
      return authUserDto;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  @override
  Future<AuthUserDto> signInWithEmailAndPassword(email, password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      IdTokenResult idToken = await result.user.getIdToken(refresh: true);

      AuthUserDto user = AuthUserDto(
        firstName: result.user.displayName.split(' ')[0],
        lastName: result.user.displayName.split(' ')[1],
        email: result.user.email,
        accessToken: idToken.token,
        imageUrl: result.user.photoUrl,
      );
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
