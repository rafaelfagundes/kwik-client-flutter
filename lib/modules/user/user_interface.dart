import 'package:kwik_client_flutter/modules/auth/auth_user_dto.dart';
import 'package:kwik_client_flutter/modules/user/user_model.dart';

abstract class IUser {
  Future getUser(String id);
  Future getUserByEmail(String email);
  Future<User> createUser(AuthUserDto user);
}
