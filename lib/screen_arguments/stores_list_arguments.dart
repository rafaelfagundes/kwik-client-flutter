import 'package:flutter/material.dart';

class StoresListArguments {
  final String id;
  final AssetImage icon;
  final String title;

  StoresListArguments({
    @required this.id,
    @required this.title,
    @required this.icon,
  });
}
