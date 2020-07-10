import 'package:kwik_client_flutter/modules/auth/auth_user_dto.dart';
import 'package:kwik_client_flutter/modules/user/user_response_dto.dart';

abstract class IUser {
  Future getUser(String id);
  Future getUserByEmail(String email);
  Future<UserResponseDto> createUser(AuthUserDto user);
  Future<UserResponseDto> createUserWithEmailAndPassword(AuthUserDto user);
}
