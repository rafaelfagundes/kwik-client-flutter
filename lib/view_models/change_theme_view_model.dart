import 'package:kwik_client_flutter/interfaces/local_storage_interface.dart';
import 'package:kwik_client_flutter/models/app_config_model.dart';

class ChangeThemeViewModel {
  final ILocalStorage storage;
  final AppConfig config = AppConfig();

  ChangeThemeViewModel({this.storage});

  Future init() async {
    await storage.get('isDark').then((value) {
      if (value != null) config.themeSwitch.value = value;
    });
  }

  changeTheme(bool value) {
    config.themeSwitch.value = value;
    storage.set('isDark', value);
  }
}
