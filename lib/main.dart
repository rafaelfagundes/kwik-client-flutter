import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:kwik_client_flutter/modules/app/app_store.dart';
import 'package:kwik_client_flutter/modules/app/local_storage_service.dart';
import 'package:provider/provider.dart';

import 'modules/app/app.dart';

Future<void> main() async {
// Set `enableInDevMode` to true to see reports while in debug mode
  // This is only to be used for confirming that reports are being
  // submitted as expected. It is not intended to be used for everyday
  // development.
  Crashlytics.instance.enableInDevMode = true;

// Pass all uncaught errors to Crashlytics.
  FlutterError.onError = Crashlytics.instance.recordFlutterError;

  WidgetsFlutterBinding.ensureInitialized();

  Intl.defaultLocale = 'pt_BR';
  initializeDateFormatting('pt_BR', null);

  var appStore = new AppStore();
  var localStorageService = new LocalStorageService();
  await appStore.init(localStorageService);

  runZoned(() {
    runApp(
      MultiProvider(
        providers: [
          Provider<AppStore>(create: (_) => appStore),
        ],
        child: App(),
      ),
    );
  }, onError: Crashlytics.instance.recordError);
}
