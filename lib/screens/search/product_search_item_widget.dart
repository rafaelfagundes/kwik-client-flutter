import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'rounded_image_widget.dart';

class ProductSearchItemWidget extends StatelessWidget {
  final String title;
  final String description;
  final double value;
  final double oldValue;
  final String url;
  final String secondaryUrl;

  const ProductSearchItemWidget({
    Key key,
    @required this.title,
    @required this.description,
    @required this.value,
    this.oldValue,
    @required this.url,
    @required this.secondaryUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
      padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 14),
      width: double.infinity,
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
                  SizedBox(height: 6),
                  Row(
                    children: <Widget>[
                      Text(
                        NumberFormat.simpleCurrency(locale: 'pt_BR')
                            .format(value),
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.bold,
                          color: Color(0xff6BC273),
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(width: 5),
                      if (oldValue != null)
                        Text(
                          NumberFormat.simpleCurrency(locale: 'pt_BR')
                              .format(oldValue),
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.normal,
                            color: Color(0xff939393),
                            fontSize: 10,
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 3),
                ],
              ),
            ),
            SizedBox(width: 10),
            RoundedImageWidget(
              url: url,
              secondaryUrl: secondaryUrl,
            )
          ],
        ),
      ),
    );
  }
}
