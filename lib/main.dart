import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/screens/home.dart';

import './themes/darkTheme.dart';
import './themes/lightTheme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Kwik',
        theme: lightTheme,
        darkTheme: darkTheme,
        home: Home(null));
  }
}
