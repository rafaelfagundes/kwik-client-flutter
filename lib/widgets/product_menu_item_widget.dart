import 'package:flutter/material.dart';

class ProductMenuItem extends StatelessWidget {
  final bool hasBottomMargin;

  const ProductMenuItem({Key key, this.hasBottomMargin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      width: MediaQuery.of(context).size.width - 48,
      child: Row(
        children: <Widget>[
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://res.cloudinary.com/kardappio/image/upload/v1588019524/ixc1s8t8wxcbce3tudvf.jpg'),
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Cheeseburger',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontFamily: 'Lato',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  'Hambúrguer, tomate, cheddar, molho especial, bacon, batata palito acompanha',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Theme.of(context).primaryColor.withOpacity(0.65),
                      fontFamily: 'Lato',
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      height: 1.4),
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    'R\$',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontFamily: 'Lato',
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    '18,90',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontFamily: 'Lato',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 3),
              Text(
                'R\$ 22,90',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  decoration: TextDecoration.lineThrough,
                  fontFamily: 'Lato',
                  fontSize: 11,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
