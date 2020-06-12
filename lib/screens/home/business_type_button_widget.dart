import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/screen_arguments/stores_list_arguments.dart';

class BusinessTypeButtonWidget extends StatelessWidget {
  final String id;
  final AssetImage image;
  final String label;

  const BusinessTypeButtonWidget({
    Key key,
    @required this.id,
    @required this.image,
    @required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/stores',
            arguments: StoresListArguments(id: id, title: label, icon: image));
      },
      child: Container(
        margin: EdgeInsets.only(right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  image: DecorationImage(fit: BoxFit.cover, image: image)),
            ),
            SizedBox(height: 5),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
            )
          ],
        ),
      ),
    );
  }
}
