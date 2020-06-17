import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/widgets/store_info_widget.dart';

import 'rounded_image_widget.dart';

class StoreSearchItemWidget extends StatelessWidget {
  final bool isOpen;
  final String title;
  final String description;
  final double rating;
  final int numberOfRatings;
  final List<int> deliveryTimes;
  final String url;

  const StoreSearchItemWidget({
    Key key,
    @required this.isOpen,
    @required this.title,
    @required this.description,
    @required this.rating,
    @required this.numberOfRatings,
    @required this.deliveryTimes,
    @required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
      padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 14),
      width: double.infinity,
      height: 102.0,
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
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 5),
                  Text(
                    isOpen ? 'ABERTO' : 'FECHADO',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 9,
                      fontWeight: FontWeight.w900,
                      color: isOpen ? Color(0xff6BC273) : Color(0xffEF5D60),
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    description,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff7B7B7B),
                    ),
                  ),
                  SizedBox(height: 6),
                  Container(
                    width: 238,
                    height: 16,
                    child: StoreInfoWidget(
                      rating: rating,
                      numberOfRatings: numberOfRatings,
                      deliveryTimes: deliveryTimes,
                      // distance: 4.7,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            RoundedImageWidget(
              url: url,
            )
          ],
        ),
      ),
    );
  }
}
