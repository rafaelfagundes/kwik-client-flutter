import 'package:flutter/material.dart';

import './business_type_button_widget.dart';

class BusinessTypeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var items = [
      BusinessTypeButtonWidget(
        key: ValueKey('2ffdc9dd-8fe0-4052-b148-df9f8ec967d1'),
        id: '2ffdc9dd-8fe0-4052-b148-df9f8ec967d1',
        label: 'Entregas',
        image: AssetImage(
          'assets/images/business-types/Entregas.jpg',
        ),
        isDeliveryRequest: true,
      ),
      BusinessTypeButtonWidget(
        key: ValueKey('f7d49003-8eb6-43f4-b2c5-9a93efae4d42'),
        id: 'f7d49003-8eb6-43f4-b2c5-9a93efae4d42',
        label: 'Comida',
        image: AssetImage(
          'assets/images/business-types/Restaurantes.jpg',
        ),
      ),
      BusinessTypeButtonWidget(
        key: ValueKey('099badae-17e1-4733-bf72-3734a7dc6661'),
        id: '099badae-17e1-4733-bf72-3734a7dc6661',
        label: 'Farmácias',
        image: AssetImage(
          'assets/images/business-types/Farmacias.jpg',
        ),
      ),
      BusinessTypeButtonWidget(
        key: ValueKey('fea3d473-8792-48ef-8f6d-1cc94dd41a97'),
        id: 'fea3d473-8792-48ef-8f6d-1cc94dd41a97',
        label: 'Mercados',
        image: AssetImage(
          'assets/images/business-types/Mercados.jpg',
        ),
      ),
      BusinessTypeButtonWidget(
        key: ValueKey('429d04dd-5056-4f07-8b22-94da460bb894'),
        id: '429d04dd-5056-4f07-8b22-94da460bb894',
        label: 'Bebida',
        image: AssetImage(
          'assets/images/business-types/Bebidas.jpg',
        ),
      ),
      BusinessTypeButtonWidget(
        key: ValueKey('2c6c83cc-2deb-43d2-a681-323369bade6d'),
        id: '2c6c83cc-2deb-43d2-a681-323369bade6d',
        label: 'Água e Gás',
        image: AssetImage(
          'assets/images/business-types/AguaGas.jpg',
        ),
      ),
      BusinessTypeButtonWidget(
        key: ValueKey('4f82846a-85be-4a58-ba0c-3df51901b1be'),
        id: '4f82846a-85be-4a58-ba0c-3df51901b1be',
        label: 'Churrasco',
        image: AssetImage(
          'assets/images/business-types/Churrasco.jpg',
        ),
      ),
      BusinessTypeButtonWidget(
        key: ValueKey('c430c447-a4f4-484f-825a-28e01c4c2b1b'),
        id: 'c430c447-a4f4-484f-825a-28e01c4c2b1b',
        label: 'Lojas',
        image: AssetImage(
          'assets/images/business-types/Lojas.jpg',
        ),
      ),
      BusinessTypeButtonWidget(
        key: ValueKey('b92a6d36-c326-4706-9f98-206a99f2caf6'),
        id: 'b92a6d36-c326-4706-9f98-206a99f2caf6',
        label: 'Papelarias',
        image: AssetImage(
          'assets/images/business-types/Papelaria.jpg',
        ),
      ),
      BusinessTypeButtonWidget(
        key: ValueKey('6abeb5cb-5ceb-4c1e-bd14-0f5f773e516d'),
        id: '6abeb5cb-5ceb-4c1e-bd14-0f5f773e516d',
        label: 'Saúde',
        image: AssetImage(
          'assets/images/business-types/Suplementos.jpg',
        ),
      ),
    ];
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: <Widget>[...items],
            ),
          )
        ],
      ),
    );
  }
}
