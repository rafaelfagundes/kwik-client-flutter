import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/widgets/search_bar_widget.dart';

class SimulatedSearchBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SearchBarWidget(
      readOnly: true,
      hintText: 'O que deseja hoje?',
      onTap: () {
        Navigator.pushNamed(context, '/search');
      },
    );
  }
}
