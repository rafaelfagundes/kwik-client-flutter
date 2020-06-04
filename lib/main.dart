import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/services/local_storage_service.dart';
import 'package:kwik_client_flutter/stores/app_store.dart';
import 'package:provider/provider.dart';

import './app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
