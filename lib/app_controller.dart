import 'package:flutter/foundation.dart';
import 'package:kwik_client_flutter/services/local_storage_service.dart';
import 'package:kwik_client_flutter/view_models/change_theme_view_model.dart';

class AppController {
  static final AppController instance = AppController._();
  final ChangeThemeViewModel changeThemeViewModel =
      ChangeThemeViewModel(storage: LocalStorageService());

  AppController._() {
    changeThemeViewModel.init();
  }

  bool get isDark => changeThemeViewModel.config.themeSwitch.value;
  ValueNotifier<bool> get themeSwitch =>
      changeThemeViewModel.config.themeSwitch;

  void changeTheme(bool value) {
    changeThemeViewModel.changeTheme(value);
  }
}
