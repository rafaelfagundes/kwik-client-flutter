import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/screens/home.dart';
import 'package:kwik_client_flutter/themes/lightTheme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Kwik', theme: lightTheme, home: Home(null));
  }
}
