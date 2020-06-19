import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/widgets/default_screen_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HelpScreen extends StatelessWidget {
  final String url = 'https://kwik.rafaelfagundes.now.sh/faq?tipo=cliente';

  @override
  Widget build(BuildContext context) {
    return DefaultScreen(
      'Ajuda',
      children: <Widget>[
        Container(
          height: 600,
          child: WebView(
            initialUrl: url,
            javascriptMode: JavascriptMode.unrestricted,
          ),
        )
      ],
    );
  }
}
