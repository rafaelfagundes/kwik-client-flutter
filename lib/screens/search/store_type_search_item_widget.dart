import 'package:flutter/material.dart';

import 'rounded_image_widget.dart';

class StoreTypeSearchItemWidget extends StatelessWidget {
  final String title;
  final String description;
  final String url;

  const StoreTypeSearchItemWidget({
    Key key,
    @required this.title,
    @required this.description,
    @required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
      padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 14),
      width: double.infinity,
      // height: 90.0,
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
                  SizedBox(height: 2),
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
                  Container(
                    child: Text(
                      description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff7B7B7B),
                      ),
                    ),
                  ),
                  SizedBox(height: 3),
                ],
              ),
            ),
            SizedBox(width: 10),
            RoundedImageWidget(
              url: url,
            )
          ],
        ),
      ),
    );
  }
}
