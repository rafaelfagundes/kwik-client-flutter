import 'package:kwik_client_flutter/modules/app/local_storage_interface.dart';
import 'package:mobx/mobx.dart';

part 'app_store.g.dart';

class AppStore = _AppStore with _$AppStore;

abstract class _AppStore with Store {
  @observable
  bool isDark = false;

  @action
  Future init(ILocalStorage localStorageService) async {
    var _isDark = await localStorageService.get('isDark');
    if (_isDark != null) isDark = _isDark;
  }

  @action
  bool setIsDark(bool _isDark) {
    isDark = _isDark;
    return _isDark;
  }
}
