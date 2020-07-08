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

  static Gender _getGender(String gender) {
    switch (gender) {
      case "Gender.FEMALE":
        return Gender.FEMALE;
      case "Gender.MALE":
        return Gender.MALE;
      case "Gender.OTHER":
        return Gender.OTHER;
      default:
        return Gender.OTHER;
    }
  }

  Map<String, dynamic> toJson() => {
        'id': this.id,
        'firstName': this.firstName,
        'lastName': this.lastName,
        'email': this.email,
        'phoneNumber': this.phoneNumber,
        'dateOfBirth': this.dateOfBirth,
        'gender': this.gender.toString(),
        'avatarUrl': this.avatarUrl,
        'currentCityId': this.currentCityId,
        'displayName': this.displayName,
      };

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        firstName = json['firstName'],
        lastName = json['lastName'],
        email = json['email'],
        phoneNumber = json['phoneNumber'],
        dateOfBirth = json['dateOfBirth'],
        gender = _getGender(json['gender']),
        avatarUrl = json['avatarUrl'],
        currentCityId = json['currentCityId'],
        displayName = json['displayName'];

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
