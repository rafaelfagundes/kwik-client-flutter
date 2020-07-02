import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:kwik_client_flutter/modules/app/app_store.dart';
import 'package:kwik_client_flutter/modules/app/local_storage_service.dart';
import 'package:provider/provider.dart';

import 'modules/app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Intl.defaultLocale = 'pt_BR';
  initializeDateFormatting('pt_BR', null);

  var appStore = new AppStore();
  var localStorageService = new LocalStorageService();
  await appStore.init(localStorageService);

  runApp(MultiProvider(
    providers: [
      Provider<AppStore>(create: (_) => appStore),
    ],
    child: App(),
  ));
}
