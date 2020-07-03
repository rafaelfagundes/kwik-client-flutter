import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:kwik_client_flutter/screens/store/inner_screens/ratings/stars_widget.dart';
import 'package:kwik_client_flutter/utils/image_utils.dart';
import 'package:kwik_client_flutter/widgets/rounded_avatar_widget.dart';

class UserRatingWidget extends StatelessWidget {
  UserRatingWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 24, right: 16),
      padding: EdgeInsets.only(bottom: 16),
      width: MediaQuery.of(context).size.width - 32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: Theme.of(context).cardColor,
        boxShadow: [
          BoxShadow(
            color: const Color(0x0d000000),
            offset: Offset(0, 4),
            blurRadius: 16,
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          RatingHeader(),
          RatingText(),
          SizedBox(height: 16),
          UserUploadedPhotos(),
          // SizedBox(height: 5),
          // Divider(),
          Container(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(children: <Widget>[
                  RatingButton(
                    value: 35,
                    isActive: true,
                  ),
                  SizedBox(width: 16),
                  RatingButton(isUp: false, value: 4, isActive: false),
                ]),
                Icon(
                  SFSymbols.ellipsis,
                  size: 18,
                  color: Color(0xffAEAEAE),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RatingButton extends StatelessWidget {
  final int value;
  final bool isUp;
  final bool isActive;

  const RatingButton({
    Key key,
    @required this.value,
    this.isUp = true,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Icon(
            isUp
                ? SFSymbols.hand_thumbsup_fill
                : SFSymbols.hand_thumbsdown_fill,
            size: 18,
            color:
                isActive ? Theme.of(context).primaryColor : Color(0xffAEAEAE),
          ),
          SizedBox(width: 3),
          Text(
            value.toString(),
            style: TextStyle(
              fontFamily: 'Lato',
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color:
                  isActive ? Theme.of(context).primaryColor : Color(0xffAEAEAE),
            ),
          )
        ],
      ),
    );
  }
}

class UserUploadedPhotos extends StatelessWidget {
  final List<Widget> items = [
    ProductUserPhoto(
      url:
          'https://res.cloudinary.com/kardappio/image/upload/v1588019524/ixc1s8t8wxcbce3tudvf.jpg',
    ),
    ProductUserPhoto(
      url:
          'https://res.cloudinary.com/kardappio/image/upload/v1588929466/gjaedamrtvsoee8s74ka.jpg',
    ),
    ProductUserPhoto(
      url:
          'https://res.cloudinary.com/kardappio/image/upload/v1587699685/t4x5ckmfasibhih61hwe.jpg',
    )
  ];

  UserUploadedPhotos({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width - 62),
      child: Wrap(
        spacing: 10.0,
        children: <Widget>[...items],
      ),
    );
  }
}

class ProductUserPhoto extends StatelessWidget {
  final String url;

  const ProductUserPhoto({
    Key key,
    @required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width - 62 - 20) / 3;

    return Container(
      width: width,
      height: 95,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(ImageUtils.resizeCloudinaryImageFromUrl(
              url, width.toInt(), context)),
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
    );
  }
}

class RatingText extends StatelessWidget {
  const RatingText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        'Elit sed pretium, id lacinia sollicitudin bibendum. Mattis tortor nibh in cursus. Et nullam tincidunt pellentesque rhoncus. Pretium faucibus eget tristique nascetur. Mattis tortor nibh in cursus Et nullam tincidunt pellentesque rhoncus. Pretium faucibus eget tristique nascetur.',
        maxLines: 4,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontFamily: 'Lato',
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: Theme.of(context).primaryColor.withOpacity(0.8),
        ),
      ),
    );
  }
}

class RatingHeader extends StatelessWidget {
  const RatingHeader({
    Key key,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(14, 16, 16, 10),
      child: Row(
        children: <Widget>[
          RoundedAvatarWidget(
            url: ImageUtils.resizeCloudinaryImageFromUrl(
              'https://res.cloudinary.com/kardappio/image/upload/v1593727266/ImagemRaraRamo%CC%81nValdes.png',
              48,
              context,
            ),
            size: 48,
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width - 120,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Ramón Valdés',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        )),
                    Stars(
                      number: 5,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Text(
                'há 2 dias',
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff969696),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
