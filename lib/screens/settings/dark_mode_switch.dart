import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kwik_client_flutter/controllers/app_controller.dart';
import 'package:kwik_client_flutter/services/local_storage_service.dart';
import 'package:kwik_client_flutter/shared/enums.dart';
import 'package:kwik_client_flutter/stores/app_store.dart';
import 'package:provider/provider.dart';

class DarkModeSwitch extends StatefulWidget {
  static const _animations = [
    'night_idle',
    'day_idle',
    'switch_night',
    'switch_day'
  ];

  @override
  _DarkModeSwitchState createState() => _DarkModeSwitchState();
}

class _DarkModeSwitchState extends State<DarkModeSwitch> {
  final FlareControls _controls = FlareControls();
  final AppController _appController = new AppController(LocalStorageService());

  void _handleThemeSwitch(bool value) async {
    if (value) {
      _controls
          .play(DarkModeSwitch._animations[SwitchTheme.SWITCH_NIGHT.index]);
    } else {
      _controls.play(DarkModeSwitch._animations[SwitchTheme.SWITCH_DAY.index]);
    }
    await _appController.setTheme(value);
  }

  @override
  Widget build(BuildContext context) {
    var store = Provider.of<AppStore>(context);
    return Observer(
      builder: (_) => Container(
        child: GestureDetector(
          onTap: () => _handleThemeSwitch(store.setIsDark(!store.isDark)),
          child: Container(
            height: 100,
            width: 60,
            child: FlareActor(
              'assets/animations/switch_daytime.flr',
              animation: store.isDark
                  ? DarkModeSwitch._animations[0]
                  : DarkModeSwitch._animations[1],
              fit: BoxFit.contain,
              controller: _controls,
            ),
          ),
        ),
      ),
    );
  }
}
