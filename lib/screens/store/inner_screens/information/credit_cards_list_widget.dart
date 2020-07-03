import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/utils/image_utils.dart';
import 'package:kwik_client_flutter/utils/theme_utils.dart';

class CreditCardsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Wrap(
      spacing: 16,
      runSpacing: 16,
      children: <Widget>[
        CreditCardItem(
          key: ValueKey('b8c3cac4-fb08-425f-b51b-bc1c0e46c229'),
          title: 'MaxxCard',
          url:
              'https://res.cloudinary.com/kardappio/image/upload/v1588219776/kwik/assets/img/credit_cards/maxxcard.png',
        ),
        CreditCardItem(
          key: ValueKey('1762ce97-9918-4e0b-a265-22973bf6a95d'),
          title: 'Vale\nRefeição',
          url:
              'https://res.cloudinary.com/kardappio/image/upload/v1588219769/kwik/assets/img/credit_cards/vr.png',
        ),
        CreditCardItem(
          key: ValueKey('5dcb9e52-41f0-4e36-a3d0-25b0e31a4a83'),
          title: 'Alelo',
          url:
              'https://res.cloudinary.com/kardappio/image/upload/v1588219769/kwik/assets/img/credit_cards/alelo.png',
        ),
        CreditCardItem(
          key: ValueKey('b489e8c4-a2c1-4e7a-9843-6680689d902c'),
          title: 'Ticket',
          url:
              'https://res.cloudinary.com/kardappio/image/upload/v1588219769/kwik/assets/img/credit_cards/ticket.png',
        ),
        CreditCardItem(
          key: ValueKey('f9f239dc-5701-46e6-b232-68e312c4f2cb'),
          title: 'Vale Card',
          url:
              'https://res.cloudinary.com/kardappio/image/upload/v1588219768/kwik/assets/img/credit_cards/valecard.png',
        ),

        // Second Line

        CreditCardItem(
          key: ValueKey('a841e646-75b1-40a2-b961-1182893592f2'),
          title: 'Aura',
          url:
              'https://res.cloudinary.com/kardappio/image/upload/v1588219768/kwik/assets/img/credit_cards/aura.png',
        ),
        CreditCardItem(
          key: ValueKey('5acde8ad-7e79-49db-a687-16481dd5fdc6'),
          title: 'Vero Card',
          url:
              'https://res.cloudinary.com/kardappio/image/upload/v1588219768/kwik/assets/img/credit_cards/verocard.png',
        ),
        CreditCardItem(
          key: ValueKey('45c80414-f715-4c96-a0a8-3a0a5d21629f'),
          title: 'Good Card',
          url:
              'https://res.cloudinary.com/kardappio/image/upload/v1588219768/kwik/assets/img/credit_cards/goodcard.png',
        ),
        CreditCardItem(
          key: ValueKey('450ee5ef-aee5-4690-a159-1bc3bef6b148'),
          title: 'Sodexo',
          url:
              'https://res.cloudinary.com/kardappio/image/upload/v1588219768/kwik/assets/img/credit_cards/sodexo.png',
        ),
        CreditCardItem(
          key: ValueKey('796a2bae-1e9a-409b-9053-5a18114b5311'),
          title: 'Hiper',
          url:
              'https://res.cloudinary.com/kardappio/image/upload/v1588219768/kwik/assets/img/credit_cards/hiper.png',
        ),

        // Third Line

        CreditCardItem(
          key: ValueKey('f7e52f3e-8718-4fb9-ae1f-a9e0fbf09637'),
          title: 'Banescard',
          url:
              'https://res.cloudinary.com/kardappio/image/upload/v1588219767/kwik/assets/img/credit_cards/banescard.png',
        ),
        CreditCardItem(
          key: ValueKey('51dcc29f-d57c-4a7d-b364-7c27511d956f'),
          title: 'SoroCred',
          url:
              'https://res.cloudinary.com/kardappio/image/upload/v1588219767/kwik/assets/img/credit_cards/sorocred.png',
        ),
        CreditCardItem(
          key: ValueKey('6a34f531-62a0-46d1-a269-2d6cb0ab7f8f'),
          title: 'JCB',
          url:
              'https://res.cloudinary.com/kardappio/image/upload/v1588219767/kwik/assets/img/credit_cards/jcb.png',
        ),
        CreditCardItem(
          key: ValueKey('443f20ea-ee38-403c-91ff-d460cd12b5fd'),
          title: 'Credz',
          url:
              'https://res.cloudinary.com/kardappio/image/upload/v1588219766/kwik/assets/img/credit_cards/credz.png',
        ),
        CreditCardItem(
          key: ValueKey('dc73e15f-7dad-4593-bcc3-493ac1811a95'),
          title: 'Mais',
          url:
              'https://res.cloudinary.com/kardappio/image/upload/v1588219766/kwik/assets/img/credit_cards/mais.png',
        ),

        // Fourth Line

        CreditCardItem(
          key: ValueKey('6ad4c569-aa07-4dd4-8321-4df97ec34eb8'),
          title: 'Calcard',
          url:
              'https://res.cloudinary.com/kardappio/image/upload/v1588219766/kwik/assets/img/credit_cards/calcard.png',
        ),
        CreditCardItem(
          key: ValueKey('c14c9c93-2218-41ce-a49b-1450c4f40bf9'),
          title: 'GreenCard',
          url:
              'https://res.cloudinary.com/kardappio/image/upload/v1588219766/kwik/assets/img/credit_cards/greencard.png',
        ),
        CreditCardItem(
          key: ValueKey('0c2d95c4-7848-44b8-b445-96e7dc61a35b'),
          title: 'Policard',
          url:
              'https://res.cloudinary.com/kardappio/image/upload/v1588219765/kwik/assets/img/credit_cards/policard.png',
        ),
        CreditCardItem(
          key: ValueKey('bc51b680-2772-4cf1-9ac4-f88f98d9d5b8'),
          title: 'Cabal',
          url:
              'https://res.cloudinary.com/kardappio/image/upload/v1588219765/kwik/assets/img/credit_cards/cabal.png',
        ),
        CreditCardItem(
          key: ValueKey('1dc47ca5-9e34-4073-8f90-0e0e14cfee01'),
          title: 'Mastercard',
          url:
              'https://res.cloudinary.com/kardappio/image/upload/v1588216194/kwik/assets/img/credit_cards/mastercard.png',
        ),

        // Fifth Line

        CreditCardItem(
          key: ValueKey('35fdfc70-0275-4591-807a-b92fe99c28a5'),
          title: 'Visa',
          url:
              'https://res.cloudinary.com/kardappio/image/upload/v1588216194/kwik/assets/img/credit_cards/visa.png',
        ),
        CreditCardItem(
          key: ValueKey('8902a086-7861-438c-9398-7c490a5ededb'),
          title: 'Diners Club',
          url:
              'https://res.cloudinary.com/kardappio/image/upload/v1588216194/kwik/assets/img/credit_cards/dinersclub.png',
        ),
        CreditCardItem(
          key: ValueKey('d8dcc19e-09ae-4616-810f-8305431f6ec6'),
          title: 'American Express',
          url:
              'https://res.cloudinary.com/kardappio/image/upload/v1588216194/kwik/assets/img/credit_cards/amex.png',
        ),
        CreditCardItem(
          key: ValueKey('2b41e114-399b-474b-b7bd-da32c7676fd8'),
          title: 'Elo',
          url:
              'https://res.cloudinary.com/kardappio/image/upload/v1588216194/kwik/assets/img/credit_cards/elo.png',
        ),

        // Sixth Line

        CreditCardItem(
          key: ValueKey('b2baf87d-1985-4ed5-ae41-a84a9f65d1b9'),
          title: 'Discover',
          url:
              'https://res.cloudinary.com/kardappio/image/upload/v1588216194/kwik/assets/img/credit_cards/discover.png',
        ),
      ],
    ));
  }
}

class CreditCardItem extends StatelessWidget {
  final String url;
  final String title;

  const CreditCardItem({
    Key key,
    @required this.url,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = ThemeUtils.isDark(context);

    int cardQty = 5;
    double cardItemWidth =
        (MediaQuery.of(context).size.width - ((cardQty - 1) * 16) - 48) /
            cardQty;
    cardItemWidth = cardItemWidth - 0.01;
    double cardBorderRadius = 8;

    return Container(
      width: cardItemWidth,
      height: cardItemWidth,
      decoration: BoxDecoration(
        color: isDark ? Color(0xff3F3F3F) : Color(0xffE7E7E7),
        boxShadow: [
          BoxShadow(
            color: const Color(0x0d000000),
            offset: Offset(0, 4),
            blurRadius: 16,
          ),
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(cardBorderRadius),
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            width: cardItemWidth,
            height: cardItemWidth,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(ImageUtils.resizeCloudinaryImageFromUrl(
                    url, cardItemWidth.toInt(), context)),
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(cardBorderRadius),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
