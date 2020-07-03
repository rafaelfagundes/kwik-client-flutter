import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/utils/image_utils.dart';
import 'package:kwik_client_flutter/widgets/default_screen_widget.dart';
import 'package:kwik_client_flutter/widgets/store_item_widget.dart';

class FavoritesScreen extends StatelessWidget {
  final items = [
    StoreItem(
      key: ValueKey('ec3beb36-a38e-43d9-a15f-eb6e98baf408'),
      id: 'ec3beb36-a38e-43d9-a15f-eb6e98baf408',
      isOpen: true,
      title: 'McDonald\'s',
      description: 'Hamburgueria, Milk Shake, Lanches',
      rating: 4.3,
      numberOfRatings: 587,
      deliveryTimes: [15, 48],
      distance: 4.7,
      banner: ImageUtils.resizeCloudinaryImageFromUrl(
          'https://res.cloudinary.com/kardappio/image/upload/v1593736995/dan-gold-E6HjQaB7UEA-unsplash_1.jpg',
          600),
      logo: ImageUtils.resizeCloudinaryImageFromUrl(
          'https://res.cloudinary.com/kardappio/image/upload/v1590475069/hzy36cj4phbearm7wwrc.png',
          64 * 3),
    ),
    StoreItem(
        key: ValueKey('80677cf8-f319-4741-a650-d87a9a6e2e61'),
        id: '80677cf8-f319-4741-a650-d87a9a6e2e61',
        isOpen: false,
        title: 'Maria Fumaça Lanches',
        description: 'Fast Food, Pizzas, Churrasquinho',
        rating: 3.7,
        numberOfRatings: 456,
        deliveryTimes: [12, 50],
        distance: 2.4,
        banner: ImageUtils.resizeCloudinaryImageFromUrl(
            'https://res.cloudinary.com/kardappio/image/upload/v1588386836/nsgzxnjms3kebdjgdpvu.jpg',
            600),
        logo: ImageUtils.resizeCloudinaryImageFromUrl(
            'https://res.cloudinary.com/kardappio/image/upload/v1588896819/qw8zawqs1j1al7geejd8.png',
            64 * 3)),
  ];

  FavoritesScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScreen(
      'Favoritos',
      children: <Widget>[...items],
    );
  }
}
