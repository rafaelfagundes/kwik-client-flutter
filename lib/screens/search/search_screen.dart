import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/utils/image_utils.dart';
import 'package:kwik_client_flutter/widgets/section_title_widget.dart';

import 'product_search_item_widget.dart';
import 'search_header_widget.dart';
import 'store_search_item_widget.dart';
import 'store_type_search_item_widget.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context);
    var headerSize = mq.padding.top + 70.0;
    var items = [
      SizedBox(height: headerSize + 16),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SectionTitle('Locais', complementaryTitle: '2 resultados'),
      ),
      SizedBox(height: 16),
      StoreSearchItemWidget(
        isOpen: true,
        deliveryTimes: [15, 60],
        description: 'Hamburgueria, Milk Shake, Lanches',
        rating: 4.8,
        numberOfRatings: 587,
        title: 'McDonald\'s',
        url: ImageUtils.resizeCloudinaryImageFromUrl(
          'https://res.cloudinary.com/kardappio/image/upload/v1590475069/hzy36cj4phbearm7wwrc.png',
          64,
          context,
        ),
      ),
      StoreSearchItemWidget(
        isOpen: false,
        deliveryTimes: [18, 45],
        description: 'Hot Dog, Marmitex, Frango Frito',
        rating: 4.3,
        numberOfRatings: 256,
        title: 'Maria Fumaça Lanches',
        url: ImageUtils.resizeCloudinaryImageFromUrl(
          'https://res.cloudinary.com/kardappio/image/upload/v1588896819/qw8zawqs1j1al7geejd8.png',
          64,
          context,
        ),
      ),
      SizedBox(height: 26),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SectionTitle('Produtos', complementaryTitle: '3 resultados'),
      ),
      SizedBox(height: 16),
      ProductSearchItemWidget(
        description:
            'Dois hambúrgueres, alface, tomate, queijo cheddar, molho, alface, tomate, queijo cheddar, molho, alface, tomate, queijo cheddar, molho, ',
        oldValue: 22.9,
        secondaryUrl: ImageUtils.resizeCloudinaryImageFromUrl(
          'https://res.cloudinary.com/kardappio/image/upload/v1590475069/hzy36cj4phbearm7wwrc.png',
          24,
          context,
        ),
        url: ImageUtils.resizeCloudinaryImageFromUrl(
          'https://res.cloudinary.com/kardappio/image/upload/v1588019524/ixc1s8t8wxcbce3tudvf.jpg',
          64,
          context,
        ),
        title: 'Big Mac',
        value: 18.9,
      ),
      ProductSearchItemWidget(
        description: 'Pizza muito doida de calabresa',
        oldValue: 42.9,
        secondaryUrl: ImageUtils.resizeCloudinaryImageFromUrl(
          'https://res.cloudinary.com/kardappio/image/upload/v1592974725/62805333_10157230299954231_6045518020783112192_n.png.png',
          24,
          context,
        ),
        url: ImageUtils.resizeCloudinaryImageFromUrl(
          'https://res.cloudinary.com/kardappio/image/upload/v1588928972/mhutqwscgecgvaw5cssr.jpg',
          64,
          context,
        ),
        title: 'Pizza de Calabresa',
        value: 39.9,
      ),
      ProductSearchItemWidget(
        description: 'Hot Dog da Casa',
        secondaryUrl: ImageUtils.resizeCloudinaryImageFromUrl(
          'https://res.cloudinary.com/kardappio/image/upload/v1588298907/tyukddlp3acv7fhicrvj.png',
          24,
          context,
        ),
        url: ImageUtils.resizeCloudinaryImageFromUrl(
          'https://res.cloudinary.com/kardappio/image/upload/v1589307525/zhutlbwwom0rkjxbndkc.jpg',
          64,
          context,
        ),
        title: 'Hot Dog',
        value: 9.9,
      ),
      SizedBox(height: 26),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SectionTitle('Seções', complementaryTitle: '2 resultados'),
      ),
      SizedBox(height: 16),
      StoreTypeSearchItemWidget(
        title: 'Restaurantes',
        description:
            'Restaurantes de fast food, comida italiana, asiática, mineira, exótica',
        url:
            'https://res.cloudinary.com/kardappio/image/upload/v1592375966/kwik/assets/img/business_types/Restaurantes.png',
      ),
      StoreTypeSearchItemWidget(
        title: 'Bebidas',
        description: 'Cervejas, sucos, açaí, milk-shake',
        url:
            'https://res.cloudinary.com/kardappio/image/upload/v1592375966/kwik/assets/img/business_types/Bebidas.png',
      ),
      SizedBox(height: 36),
    ];

    return Scaffold(
      body: Container(
        child: Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Container(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return items[index];
                },
              ),
            ),
            Positioned(
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: headerSize + 5,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            SearchHeaderWidget(headerSize: headerSize),
          ],
        ),
      ),
    );
  }
}
