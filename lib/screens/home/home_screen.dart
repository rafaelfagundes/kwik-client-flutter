import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/screens/home/business_type_widget.dart';
import 'package:kwik_client_flutter/screens/home/simulated_search_bar_widget.dart';
import 'package:kwik_client_flutter/screens/home/store_horizontal_list_widget.dart';
import 'package:kwik_client_flutter/widgets/default_screen_widget.dart';
import 'package:kwik_client_flutter/widgets/store_horizontal_item_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var restaurantItems = [
      StoreHorizontalItemWidget(
        id: '8687ab63-c0b8-4a0a-be36-96743c2f4ff8',
        title: 'Burger King',
        logo:
            'https://res.cloudinary.com/kardappio/image/upload/v1592974862/logo-burger-king-4096.png',
        deliveryTimes: [28, 73],
        rating: 4.7,
      ),
      StoreHorizontalItemWidget(
        id: 'b0b27fa2-0b29-4922-8640-1ebc82cdb537',
        title: 'Pizza Hut',
        logo:
            'https://res.cloudinary.com/kardappio/image/upload/v1592974725/62805333_10157230299954231_6045518020783112192_n.png.png',
        deliveryTimes: [30, 90],
        rating: 4.1,
      ),
      StoreHorizontalItemWidget(
        id: '4be4dacd-30f5-4848-bb15-bef32c3abbf7',
        title: 'McDonald\'s',
        logo:
            'https://res.cloudinary.com/kardappio/image/upload/v1590475069/hzy36cj4phbearm7wwrc.png',
        deliveryTimes: [15, 60],
        rating: 4.5,
      ),
      StoreHorizontalItemWidget(
        id: 'a792c677-759c-4b8d-b25a-a0fed225051d',
        title: 'Maria Fumaça Lanches',
        logo:
            'https://res.cloudinary.com/kardappio/image/upload/v1588896819/qw8zawqs1j1al7geejd8.png',
        deliveryTimes: [12, 42],
        rating: 3.3,
      ),
      StoreHorizontalItemWidget(
        id: '2c09e04c-0981-4988-ae5e-96f977798a41',
        title: 'Boston Burger',
        logo:
            'https://res.cloudinary.com/kardappio/image/upload/v1588298907/tyukddlp3acv7fhicrvj.png',
        deliveryTimes: [12, 42],
        rating: 3.3,
      ),
    ];

    var drugStoreItems = [
      StoreHorizontalItemWidget(
        id: '15137124-2a4b-4681-91f2-dc08c8b37d1e',
        title: 'Drogaria Araújo',
        logo:
            'https://res.cloudinary.com/kardappio/image/upload/v1592975562/54256678_10157385424328866_734954627597860864_n.png.png',
        deliveryTimes: [14, 44],
        rating: 4.2,
      ),
      StoreHorizontalItemWidget(
        id: '7bbc7c35-12fb-4de3-98a5-2d3fbffbde9d',
        title: 'Droga Raia',
        logo:
            'https://res.cloudinary.com/kardappio/image/upload/v1592975637/48418919_2408598852488217_286995439910125568_o.png.png',
        deliveryTimes: [18, 38],
        rating: 3.9,
      ),
      StoreHorizontalItemWidget(
        id: '3e23a764-c679-458c-b89c-2c09d6ebdeed',
        title: 'Heart Farmácia',
        logo:
            'https://res.cloudinary.com/kardappio/image/upload/v1592975938/ultramed_-_dribbble.png',
        deliveryTimes: [08, 15],
        rating: 4.9,
      ),
    ];

    var drinksItems = [
      StoreHorizontalItemWidget(
        id: '60f47e20-57ad-42a8-a373-3c3fafcc46ac',
        title: 'Disk Bebidas do Tião',
        logo:
            'https://res.cloudinary.com/kardappio/image/upload/v1592976294/Disk-Bebidas-Site-1024x768-1024x768.jpg',
        deliveryTimes: [10, 21],
        rating: 3.1,
      ),
      StoreHorizontalItemWidget(
        id: 'c2111f34-3e5e-4e4f-b0e2-aa3d616fc609',
        title: 'Disk Cerveja Meio Kilo',
        logo:
            'https://res.cloudinary.com/kardappio/image/upload/v1592976482/cc54feca-90cd-4ab7-b207-3eaddd543ae8.png',
        deliveryTimes: [35, 70],
        rating: 4,
      ),
      StoreHorizontalItemWidget(
        id: '34d7e6e1-1544-4a7e-9289-1c138ce1e51b',
        title: 'Disk Cerveja Ressaca Eterna',
        logo:
            'https://res.cloudinary.com/kardappio/image/upload/v1592976734/202005011333_W4zG_i.jpg',
        deliveryTimes: [45, 90],
        rating: 4.2,
      ),
    ];

    var marketItems = [
      StoreHorizontalItemWidget(
        id: 'eeed6805-a72b-45ff-a9d6-c8a33e45d9b0',
        title: 'Carrefour',
        logo:
            'https://res.cloudinary.com/kardappio/image/upload/v1592978999/undefined.png',
        deliveryTimes: [25, 51],
        rating: 4.7,
      ),
      StoreHorizontalItemWidget(
        id: '29f6298c-9460-4a63-82d0-68faf137e532',
        title: 'Super Nosso',
        logo:
            'https://res.cloudinary.com/kardappio/image/upload/v1592978873/ptLYg3m2_400x400.jpg',
        deliveryTimes: [60, 120],
        rating: 4.6,
      ),
      StoreHorizontalItemWidget(
        id: '20c4502f-4c8c-4a05-8eb1-70674e7136e9',
        title: 'Supermercados Guanabara',
        logo:
            'https://res.cloudinary.com/kardappio/image/upload/v1592977207/12804706_1012692378766927_3779022915526634811_n.png.png',
        deliveryTimes: [75, 115],
        rating: 4.4,
      ),
    ];

    var recentItems = [
      StoreHorizontalItemWidget(
        id: '2c09e04c-0981-4988-ae5e-96f977798a41',
        title: 'Boston Burger',
        logo:
            'https://res.cloudinary.com/kardappio/image/upload/v1588298907/tyukddlp3acv7fhicrvj.png',
        deliveryTimes: [12, 42],
        rating: 3.3,
        recentlyViewed: true,
      ),
      StoreHorizontalItemWidget(
        id: '3e23a764-c679-458c-b89c-2c09d6ebdeed',
        title: 'Heart Farmácia',
        logo:
            'https://res.cloudinary.com/kardappio/image/upload/v1592975938/ultramed_-_dribbble.png',
        deliveryTimes: [08, 15],
        rating: 4.9,
        recentlyViewed: true,
      ),
      StoreHorizontalItemWidget(
        id: '34d7e6e1-1544-4a7e-9289-1c138ce1e51b',
        title: 'Disk Cerveja Ressaca Eterna',
        logo:
            'https://res.cloudinary.com/kardappio/image/upload/v1592976734/202005011333_W4zG_i.jpg',
        deliveryTimes: [45, 90],
        rating: 4.2,
        recentlyViewed: true,
      ),
      StoreHorizontalItemWidget(
        id: '1b17d45f-eb67-493c-af90-1ad25cfb7f8a',
        title: 'Supermercados Guanabara',
        logo:
            'https://res.cloudinary.com/kardappio/image/upload/v1592977207/12804706_1012692378766927_3779022915526634811_n.png.png',
        deliveryTimes: [75, 115],
        rating: 4.4,
        recentlyViewed: true,
      ),
      StoreHorizontalItemWidget(
        id: 'eeed6805-a72b-45ff-a9d6-c8a33e45d9b0',
        title: 'Carrefour',
        logo:
            'https://res.cloudinary.com/kardappio/image/upload/v1592978999/undefined.png',
        deliveryTimes: [25, 51],
        rating: 4.7,
        recentlyViewed: true,
      ),
      StoreHorizontalItemWidget(
        id: 'c2111f34-3e5e-4e4f-b0e2-aa3d616fc609',
        title: 'Disk Cerveja Meio Kilo',
        logo:
            'https://res.cloudinary.com/kardappio/image/upload/v1592976482/cc54feca-90cd-4ab7-b207-3eaddd543ae8.png',
        deliveryTimes: [35, 70],
        rating: 4,
        recentlyViewed: true,
      ),
      StoreHorizontalItemWidget(
        id: 'b0b27fa2-0b29-4922-8640-1ebc82cdb537',
        title: 'Pizza Hut',
        logo:
            'https://res.cloudinary.com/kardappio/image/upload/v1592974725/62805333_10157230299954231_6045518020783112192_n.png.png',
        deliveryTimes: [30, 90],
        rating: 4.1,
        recentlyViewed: true,
      ),
    ];

    return DefaultScreen(
      'Olá, Rafael',
      children: <Widget>[
        SimulatedSearchBarWidget(),
        SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BusinessTypeWidget(),
        ),
        SizedBox(height: 40),
        StoreHorizontalListWidget(
          title: 'Restaurantes',
          items: restaurantItems,
        ),
        SizedBox(height: 40),
        StoreHorizontalListWidget(
          title: 'Farmácias',
          items: drugStoreItems,
        ),
        SizedBox(height: 40),
        StoreHorizontalListWidget(
          title: 'Bebidas',
          items: drinksItems,
        ),
        SizedBox(height: 40),
        StoreHorizontalListWidget(
          title: 'Mercados',
          items: marketItems,
        ),
        SizedBox(height: 40),
        StoreHorizontalListWidget(
          title: 'Visitados Recentemente',
          items: recentItems,
        ),
        SizedBox(
          height: MediaQuery.of(context).padding.bottom,
        ),
      ],
    );
  }
}
