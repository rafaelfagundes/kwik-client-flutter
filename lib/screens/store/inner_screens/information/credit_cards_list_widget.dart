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
          title: 'MaxxCard',
          url:
              'https://res.cloudinary.com/kardappio/image/upload/v1588219776/kwik/assets/img/credit_cards/maxxcard.png',
        ),
        CreditCardItem(
          title: 'Vale\nRefeição',
          url:
              'https://res.cloudinary.com/kardappio/image/upload/v1588219769/kwik/assets/img/credit_cards/vr.png',
        ),
        CreditCardItem(
          title: 'Alelo',
          url:
              'https://res.cloudinary.com/kardappio/image/upload/v1588219769/kwik/assets/img/credit_cards/alelo.png',
        ),
        CreditCardItem(
          title: 'Ticket',
          url:
              'https://res.cloudinary.com/kardappio/image/upload/v1588219769/kwik/assets/img/credit_cards/ticket.png',
        ),
        CreditCardItem(
          title: 'Vale Card',
          url:
              'https://res.cloudinary.com/kardappio/image/upload/v1588219768/kwik/assets/img/credit_cards/valecard.png',
        ),

        // Second Line

        CreditCardItem(
          title: 'Aura',
          url:
              'https://res.cloudinary.com/kardappio/image/upload/v1588219768/kwik/assets/img/credit_cards/aura.png',
        ),
        CreditCardItem(
          title: 'Vero Card',
          url:
              'https://res.cloudinary.com/kardappio/image/upload/v1588219768/kwik/assets/img/credit_cards/verocard.png',
        ),
        CreditCardItem(
          title: 'Good Card',
          url:
              'https://res.cloudinary.com/kardappio/image/upload/v1588219768/kwik/assets/img/credit_cards/goodcard.png',
        ),
        CreditCardItem(
          title: 'Sodexo',
          url:
              'https://res.cloudinary.com/kardappio/image/upload/v1588219768/kwik/assets/img/credit_cards/sodexo.png',
        ),
        CreditCardItem(
          title: 'Hiper',
          url:
              'https://res.cloudinary.com/kardappio/image/upload/v1588219768/kwik/assets/img/credit_cards/hiper.png',
        ),

        // Third Line

        CreditCardItem(
          title: 'Banescard',
          url:
              'https://res.cloudinary.com/kardappio/image/upload/v1588219767/kwik/assets/img/credit_cards/banescard.png',
        ),
        CreditCardItem(
          title: 'SoroCred',
          url:
              'https://res.cloudinary.com/kardappio/image/upload/v1588219767/kwik/assets/img/credit_cards/sorocred.png',
        ),
        CreditCardItem(
          title: 'JCB',
          url:
              'https://res.cloudinary.com/kardappio/image/upload/v1588219767/kwik/assets/img/credit_cards/jcb.png',
        ),
        CreditCardItem(
          title: 'Credz',
          url:
              'https://res.cloudinary.com/kardappio/image/upload/v1588219766/kwik/assets/img/credit_cards/credz.png',
        ),
        CreditCardItem(
          title: 'Mais',
          url:
              'https://res.cloudinary.com/kardappio/image/upload/v1588219766/kwik/assets/img/credit_cards/mais.png',
        ),

        // Fourth Line

        CreditCardItem(
          title: 'Calcard',
          url:
              'https://res.cloudinary.com/kardappio/image/upload/v1588219766/kwik/assets/img/credit_cards/calcard.png',
        ),
        CreditCardItem(
          title: 'GreenCard',
          url:
              'https://res.cloudinary.com/kardappio/image/upload/v1588219766/kwik/assets/img/credit_cards/greencard.png',
        ),
        CreditCardItem(
          title: 'Policard',
          url:
              'https://res.cloudinary.com/kardappio/image/upload/v1588219765/kwik/assets/img/credit_cards/policard.png',
        ),
        CreditCardItem(
          title: 'Cabal',
          url:
              'https://res.cloudinary.com/kardappio/image/upload/v1588219765/kwik/assets/img/credit_cards/cabal.png',
        ),
        CreditCardItem(
          title: 'Mastercard',
          url:
              'https://res.cloudinary.com/kardappio/image/upload/v1588216194/kwik/assets/img/credit_cards/mastercard.png',
        ),

        // Fifth Line

        CreditCardItem(
          title: 'Visa',
          url:
              'https://res.cloudinary.com/kardappio/image/upload/v1588216194/kwik/assets/img/credit_cards/visa.png',
        ),
        CreditCardItem(
          title: 'Diners Club',
          url:
              'https://res.cloudinary.com/kardappio/image/upload/v1588216194/kwik/assets/img/credit_cards/dinersclub.png',
        ),
        CreditCardItem(
          title: 'American Express',
          url:
              'https://res.cloudinary.com/kardappio/image/upload/v1588216194/kwik/assets/img/credit_cards/amex.png',
        ),
        CreditCardItem(
          title: 'Elo',
          url:
              'https://res.cloudinary.com/kardappio/image/upload/v1588216194/kwik/assets/img/credit_cards/elo.png',
        ),

        // Sixth Line

        CreditCardItem(
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
