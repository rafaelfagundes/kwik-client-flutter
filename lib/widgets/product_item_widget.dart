import 'package:flutter/material.dart';

class ProductItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      height: 140,
      margin: EdgeInsets.only(right: 16),
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Container(
            width: 190,
            height: 140,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://res.cloudinary.com/kardappio/image/upload/v1588019524/ixc1s8t8wxcbce3tudvf.jpg'),
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
          ),
          Positioned(
            top: 16,
            right: -6,
            child: Container(
              width: 38,
              height: 22,
              decoration: BoxDecoration(
                  color: Color(0xffEF5D60),
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              child: Center(
                child: Text(
                  '5%',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Lato',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 80,
            height: 60,
            width: 190,
            child: Container(
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 99,
            left: 12,
            width: 190,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Cheeseburger Monster',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Lato',
                    fontSize: 14,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'R\$',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Lato',
                        fontSize: 10,
                      ),
                    ),
                    Text(
                      '17,40',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Lato',
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 3),
                    Text(
                      'R\$ 23,90',
                      style: TextStyle(
                        color: Color(0xffDDD5D5),
                        fontFamily: 'Lato',
                        fontSize: 10,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
