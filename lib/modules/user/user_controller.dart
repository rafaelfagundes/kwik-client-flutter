import 'package:kwik_client_flutter/modules/auth/auth_user_dto.dart';
import 'package:kwik_client_flutter/modules/user/user_model.dart';
import 'package:kwik_client_flutter/modules/user/user_service.dart';

class UserController {
  UserService userService;
  UserController(this.userService);

  Future<User> createUser(AuthUserDto user) async {
    return await this.userService.createUser(user);
  }

  Future<User> getUserByEmail(String email) async {
    return await this.userService.getUserByEmail(email);
  }
}
