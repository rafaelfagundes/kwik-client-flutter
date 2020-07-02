import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kwik_client_flutter/modules/cart/cart_item.dart';
import 'package:kwik_client_flutter/widgets/integer_qty_widget.dart';
import 'package:kwik_client_flutter/widgets/product_aditional_widget.dart';
import 'package:kwik_client_flutter/widgets/rounded_square_product_image_widget.dart';
import 'package:kwik_client_flutter/widgets/section_subtitle_widget.dart';

import 'options_list_widget.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem item;

  const CartItemWidget({
    Key key,
    @required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
      padding: EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 16),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width - 150,
                      child: Text(
                        item.title,
                        style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 18,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w700,
                            height: 1),
                        textAlign: TextAlign.left,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: 6),
                    OptionsListWidget(productOptions: item.productOptions),
                    if (item.additionalItems == null)
                      Column(
                        children: <Widget>[
                          SizedBox(height: 8),
                          IntegerQtyWidget(
                            value: item.itemQty,
                            onChange: () {},
                            size: 22,
                            min: 1,
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              RoundedSquareProductImageWidget(
                size: 76,
                url: item.urlImage,
              ),
            ],
          ),
          if (item.additionalItems != null)
            Column(
              children: <Widget>[
                SizedBox(height: 10),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IntegerQtyWidget(
                        value: item.itemQty,
                        onChange: () {},
                        size: 22,
                        min: 1,
                      ),
                      Text(
                        NumberFormat.simpleCurrency(locale: 'pt_BR')
                            .format(item.itemInitialPrice),
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 14,
                          color: Color(0xFF6BC273),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          SizedBox(height: 10),
          if (item.additionalItems != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 10),
                SectionSubTitle('adicionais'),
                SizedBox(height: 10),
                ...item.additionalItems.map((add) {
                  return ProductAditionalWidget(
                    label: add.label,
                    value: add.price,
                    qty: add.qty,
                    onChange: () {},
                  );
                })
              ],
            ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                item.additionalItems == null
                    ? 'VALOR DO ITEM'
                    : 'TOTAL DESTE ITEM',
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 12,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                NumberFormat.simpleCurrency(locale: 'pt_BR')
                    .format(item.itemTotalPrice),
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color(0xff6BC273),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
