import 'package:flutter/foundation.dart';
import 'package:kwik_client_flutter/modules/user/user_model.dart';

enum AuthResponseStatus { OK, CANCELLED, ERROR, USER_NOT_FOUND }

class AuthResponseDto {
  final User user;
  final AuthResponseStatus status;
  final String message;

  AuthResponseDto({
    @required this.user,
    @required this.status,
    @required this.message,
  });
}
