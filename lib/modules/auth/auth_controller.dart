import 'dart:developer';

import 'package:kwik_client_flutter/modules/auth/auth_service.dart';
import 'package:kwik_client_flutter/modules/auth/auth_user_dto.dart';
import 'package:kwik_client_flutter/modules/user/user_controller.dart';
import 'package:kwik_client_flutter/modules/user/user_model.dart';

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
        User newUser = await this.userController.createUser(result);
        if (newUser != null) {
          return newUser;
        } else {
          return null;
        }
      }
    } else {
      return null;
    }
  }

  Future<User> facebookSignIn() async {
    AuthUserDto result = await this.authService.facebookSignIn();
    if (result.isCancelled) {
      print('user cancelled');
      // I had to do this to differentiate when the user canceled or when it was an error
      var user = User(
        id: 'cancelledByUser',
      );
      return user;
    } else if (result != null) {
      print('user not cancelled');
      User user = await this.userController.getUserByEmail(result.email);
      if (user != null) {
        print('user found');
        return user;
      } else {
        print('user not found');
        User newUser = await this.userController.createUser(result);
        inspect(newUser);
        if (newUser != null) {
          print('new user created');
          return newUser;
        } else {
          print('new user not created');
          return null;
        }
      }
    } else {
      return null;
    }
  }

  Future<bool> passwordRecovery(String email) async {
    return await this.authService.passwordRecovery(email);
  }
}
