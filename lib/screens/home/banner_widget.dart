import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/app_controller.dart';

class BannerWidget extends StatelessWidget {
  final bool _isDark = AppController.instance.isDark;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          GestureDetector(
              onTap: () {
                print('Delivery');
              },
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: _isDark
                      ? Image.asset('assets/images/banners/Delivery-Dark.png')
                      : Image.asset(
                          'assets/images/banners/Delivery-Light.png'))),
        ],
      ),
    );
  }
}
