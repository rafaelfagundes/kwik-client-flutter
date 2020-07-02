import 'package:flutter/foundation.dart';
import 'package:kwik_client_flutter/shared/enums.dart';

class User {
  String id;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  DateTime dateOfBirth;
  Gender gender;
  String avatarUrl;
  String currentCityId;
  String displayName;

  User({
    @required this.id,
    @required this.firstName,
    @required this.lastName,
    @required this.email,
    this.phoneNumber,
    this.dateOfBirth,
    @required this.gender,
    this.avatarUrl,
    this.currentCityId,
  }) {
    this.displayName = this.firstName + ' ' + this.lastName;
  }
}
