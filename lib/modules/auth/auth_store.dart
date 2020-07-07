import 'dart:convert';

import 'package:kwik_client_flutter/modules/app/local_storage_interface.dart';
import 'package:kwik_client_flutter/modules/auth/user_model.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  ILocalStorage localStorageService;

  @observable
  User user;

  @observable
  bool isLogged;

  @action
  Future<void> setIsLogged(bool isLogged) async {
    await localStorageService.set('isLogged', isLogged);
    this.isLogged = isLogged;
  }

  @action
  Future init(ILocalStorage localStorageService) async {
    this.localStorageService = localStorageService;

    String _userFromLocalStorage = await this.localStorageService.get('user');
    if (_userFromLocalStorage != null) {
      var _decodedUser = json.decode(_userFromLocalStorage);
      User _user = User.fromJson(_decodedUser);

      if (_user != null) this.user = _user;
    }

    bool _isLogged = await this.localStorageService.get('isLogged');
    if (_isLogged != null) {
      this.isLogged = _isLogged;
    } else {
      this.isLogged = false;
    }
  }

  @action
  Future<User> setUser(User _user) async {
    user = _user;
    String _userFromJson = json.encode(_user.toJson());
    await localStorageService.set('user', _userFromJson);
    return _user;
  }

  @action
  Future<void> clearUser() async {
    user = null;
    await localStorageService.delete('user');
  }

  @action
  Future<void> signOut() async {
    await localStorageService.set('isLogged', false);
    this.isLogged = false;
  }

  User get getUser => user;
  bool get getIsLogged => isLogged;
}
