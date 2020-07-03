import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/screen_arguments/stores_list_arguments.dart';

class BusinessTypeButtonWidget extends StatelessWidget {
  final String id;
  final AssetImage image;
  final String label;
  final bool isDeliveryRequest;

  const BusinessTypeButtonWidget({
    @required Key key,
    @required this.id,
    @required this.image,
    @required this.label,
    this.isDeliveryRequest = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var margin = 16;
    var itemSpacing = 10;
    var itemRowQty = 5;
    var iconSize = (MediaQuery.of(context).size.width -
            (itemRowQty * itemSpacing - itemSpacing) -
            (margin * 2)) /
        itemRowQty;

    return GestureDetector(
      onTap: () {
        isDeliveryRequest
            ? Navigator.pushNamed(context, '/delivery_request')
            : Navigator.pushNamed(context, '/stores',
                arguments:
                    StoresListArguments(id: id, title: label, icon: image));
      },
      child: Container(
        // margin: EdgeInsets.only(right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: iconSize,
              height: iconSize,
              decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius:
                      BorderRadius.all(Radius.circular(iconSize * 0.214521452)),
                  image: DecorationImage(fit: BoxFit.cover, image: image)),
            ),
            SizedBox(height: 5),
            Container(
              width: iconSize,
              // height: 12.7,
              height: 14,
              child: Center(
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    label,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).primaryColor),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
