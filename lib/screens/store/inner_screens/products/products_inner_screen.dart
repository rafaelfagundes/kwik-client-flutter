import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/widgets/custom_expansion_tile_widget.dart';
import 'package:kwik_client_flutter/widgets/product_menu_item_widget.dart';

class ProductsInner extends StatelessWidget {
  final items = [
    ProductMenuItem(),
    ProductMenuItem(),
    ProductMenuItem(),
    ProductMenuItem(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: <Widget>[
          Divider(),
          CustomExpansionTile(
            tilePadding: EdgeInsets.all(0),
            initiallyExpanded: true,
            title: Text(
              'Carne de Boi',
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            children: <Widget>[...items],
          ),
          CustomExpansionTile(
            tilePadding: EdgeInsets.all(0),
            initiallyExpanded: false,
            title: Text(
              'Carne de Frango',
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            children: <Widget>[...items],
          ),
          CustomExpansionTile(
            tilePadding: EdgeInsets.all(0),
            initiallyExpanded: false,
            title: Text(
              'Carne de Peixe',
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            children: <Widget>[...items],
          ),
          CustomExpansionTile(
            tilePadding: EdgeInsets.all(0),
            initiallyExpanded: false,
            title: Text(
              'Carne de Porco',
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            children: <Widget>[...items],
          ),
          SizedBox(height: 72),
        ],
      ),
    );
  }
}
