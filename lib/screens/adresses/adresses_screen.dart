import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/screens/adresses/address_item_widget.dart';
import 'package:kwik_client_flutter/widgets/add_button_widget.dart';
import 'package:kwik_client_flutter/widgets/default_screen_widget.dart';

class Adresses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultScreen(
      'Endereços',
      children: <Widget>[
        AddressItemWidget(
          title: 'Rua Frederico Ozanan, 150',
          subtitle: 'Guarda-Mor',
          city: 'São João del Rei, MG',
          isDefault: true,
        ),
        AddressItemWidget(
          title: 'Prof. Miguel de Souza, 116 - AP 303',
          subtitle: 'Buritis',
          city: 'Belo Horizonte, MG',
          isDefault: false,
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: AddButton(
            buttonText: 'Adicionar Endereço',
            onPressed: () {
              Navigator.pushNamed(context, "/add-edit-address");
            },
          ),
        )
      ],
    );
  }
}
