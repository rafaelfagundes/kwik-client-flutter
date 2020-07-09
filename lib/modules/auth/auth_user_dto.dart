import 'package:flutter/foundation.dart';

class AuthUserDto {
  final String firstName;
  final String lastName;
  final String email;
  final String accessToken;
  final String imageUrl;
  final bool isCancelled;

  AuthUserDto({
    @required this.firstName,
    @required this.lastName,
    @required this.email,
    @required this.accessToken,
    this.imageUrl,
    this.isCancelled = false,
  });
}
