import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kwik_client_flutter/modules/app/app_store.dart';
import 'package:provider/provider.dart';

class BannerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AppStore>(context);
    return Observer(
      builder: (_) => Container(
        child: Column(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  print('Delivery');
                },
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: store.isDark
                        ? Image.asset('assets/images/banners/Delivery-Dark.png')
                        : Image.asset(
                            'assets/images/banners/Delivery-Light.png'))),
          ],
        ),
      ),
    );
  }
}
