import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/widgets/rounded_avatar_widget.dart';

class UserProfileHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).brightness.toString() == "Brightness.dark";

    return Container(
      width: double.infinity,
      height: 105,
      margin: EdgeInsets.symmetric(horizontal: 16),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 2),
                Text(
                  'Antônio Zacarias',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lato'),
                ),
                SizedBox(height: 5),
                Text(
                  'Sara.Barros@yahoo.com',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor.withOpacity(.8),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Lato'),
                ),
                SizedBox(height: 16),
                Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        print('Change Password');
                      },
                      child: Container(
                        child: Text('ALTERAR SENHA',
                            style: TextStyle(
                                color: isDark
                                    ? Color(0xFFED7B84)
                                    : Color(0xFF6B3D92),
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Lato')),
                      ),
                    ),
                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        print('Change Picture');
                      },
                      child: Container(
                        child: Text('ALTERAR FOTO',
                            style: TextStyle(
                                color: isDark
                                    ? Color(0xFFED7B84)
                                    : Color(0xFF6B3D92),
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Lato')),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            width: 74,
            height: 74,
            margin: EdgeInsets.only(right: 16),
            child: RoundedAvatarWidget(
              animationDuration: 100,
              size: 74,
              url:
                  'https://res.cloudinary.com/kardappio/image/upload/v1588906717/c8vczpgvbmqmyyf5bmel.jpg',
            ),
          ),
        ],
      ),
    );
  }
}
