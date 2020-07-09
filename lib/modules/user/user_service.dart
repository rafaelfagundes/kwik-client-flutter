import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:kwik_client_flutter/config/api_config.dart';
import 'package:kwik_client_flutter/modules/auth/auth_user_dto.dart';
import 'package:kwik_client_flutter/modules/user/user_interface.dart';
import 'package:kwik_client_flutter/modules/user/user_model.dart';

class UserService implements IUser {
  @override
  Future<User> createUser(AuthUserDto user) async {
    String url = '${Api.baseUrl}/users';

    var response = await http.post(url, body: {
      'firstName': user.firstName,
      'lastName': user.lastName,
      'email': user.email,
      'gender': 'O',
    });

    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');

    switch (response.statusCode) {
      case 201:
        // inspect(response);
        // print('Response status: ${response.statusCode}');
        // print('Response body: ${response.body}');
        try {
          User user = User.fromJson(json.decode(response.body));
          print('service.createUser');
          inspect(user);
          return user;
        } catch (e) {
          print('Error when creating user');
          return null;
        }
        break;
      default:
        return null;
    }
  }

  @override
  Future getUser(String id) {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<User> getUserByEmail(String email) async {
    String url = '${Api.baseUrl}/users?email=$email';
    var response = await http.get(url);

    switch (response.statusCode) {
      case 200:
        // inspect(response);
        // print('Response status: ${response.statusCode}');
        // print('Response body: ${response.body}');
        return User.fromJson(json.decode(response.body));
      default:
        return null;
    }
  }
}
