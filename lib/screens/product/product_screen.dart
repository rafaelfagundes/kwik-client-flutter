import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kwik_client_flutter/modules/product/product_option_model.dart';
import 'package:kwik_client_flutter/screen_arguments/product_arguments.dart';
import 'package:kwik_client_flutter/widgets/integer_qty_widget.dart';
import 'package:kwik_client_flutter/widgets/product_aditional_widget.dart';
import 'package:kwik_client_flutter/widgets/section_title_widget.dart';

import 'option_widget.dart';
import 'product_header_widget.dart';
import 'value_and_add_footer_widget.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen>
    with SingleTickerProviderStateMixin {
  int _productQty = 1;

  void _onChange(qty) {
    setState(() {
      _productQty = qty;
    });
  }

  @override
  Widget build(BuildContext context) {
    double expandedHeight = 280;
    double collapsedHeight = MediaQuery.of(context).padding.top + 48;

    final ProductArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Stack(
        children: <Widget>[
          Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: CustomScrollView(
              slivers: <Widget>[
                SliverPersistentHeader(
                  delegate: ProductHeaderWidget(
                      title: args.title,
                      expandedHeight: expandedHeight,
                      collapsedHeight: collapsedHeight,
                      heroId: args.heroId,
                      logo: args.logo,
                      banner: args.banner,
                      hasDiscount: args.hasDiscount,
                      oldValue: args.oldValue,
                      value: args.value,
                      discountType: args.discountType,
                      discountValue: args.discountValue),
                  pinned: true,
                  floating: true,
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    <Widget>[
                      Stack(
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 24.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SectionTitle('Descrição'),
                                SizedBox(height: 10),
                                Text(
                                  'Voluptas ipsum doloremque. Id voluptatum aspernatur exercitationem. Nesciunt omnis nulla. Earum veniam ipsum aut sunt occaecati. Iste omnis temporibus. Ad sequi et et officiis aut sunt explicabo minus. Quo ut aperiam occaecati repellat error ut amet enim nobis. Voluptatem quam amet omnis quam. Dolorum dolores earum numquam minus. Sequi voluptas rem quos aut magni adipisci. Blanditiis saepe assumenda autem. Qui beatae molestias nihil placeat eveniet. Aut ducimus illo et. Earum reprehenderit sit voluptatem commodi ad aut et placeat quis. Reiciendis velit unde aut dolor. Inventore ut suscipit. Eius ut perspiciatis praesentium voluptatem tempora nam. Aut quam ut excepturi. Necessitatibus aut omnis quia sit temporibus sapiente nemo. Hic autem exercitationem in assumenda nostrum.',
                                  style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 14,
                                      color: Theme.of(context).primaryColor),
                                  maxLines: 5,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 32),
                                SectionTitle('Quantidade'),
                                SizedBox(height: 10),
                                IntegerQtyWidget(
                                  value: _productQty,
                                  onChange: _onChange,
                                  min: 1,
                                ),
                                SizedBox(height: 32),
                                SectionTitle('Opções'),
                                SizedBox(height: 16),
                                OptionWidget(title: 'Tipo de Carne', items: [
                                  ProductOption(
                                    label: 'Boi',
                                    value:
                                        '5cce428c-6900-436e-a235-9a09277eac68',
                                    optionPrice: 0,
                                  ),
                                  ProductOption(
                                    label: 'Frango',
                                    value:
                                        '5cce428c-6900-4561-a235-9a09277eac68',
                                    optionPrice: 3.0,
                                  ),
                                  ProductOption(
                                    label: 'Porco',
                                    value:
                                        '5cce428c-6900-1234-a235-9a09277eac68',
                                    optionPrice: 3.5,
                                  ),
                                ]),
                                SizedBox(height: 16),
                                OptionWidget(title: 'Tipo de Queijo', items: [
                                  ProductOption(
                                    label: 'Cheddar',
                                    value:
                                        '5cce428c-6900-436e-a235-9a09277eac68',
                                    optionPrice: 0,
                                  ),
                                  ProductOption(
                                    label: 'Muçarela',
                                    value:
                                        '5cce428c-6900-4561-a235-9a09277eac68',
                                    optionPrice: 3.0,
                                  ),
                                  ProductOption(
                                    label: 'Catupiry',
                                    value:
                                        '5cce428c-6900-1234-a235-9a09277eac68',
                                    optionPrice: 2.5,
                                  ),
                                ]),
                                SizedBox(height: 16),
                                OptionWidget(title: 'Molho', items: [
                                  ProductOption(
                                    label: 'Da Casa',
                                    value:
                                        '5cce428c-6900-436e-a235-9a09277eac68',
                                    optionPrice: 0,
                                  ),
                                  ProductOption(
                                    label: 'Barbecue',
                                    value:
                                        '5cce428c-6900-4561-a235-9a09277eac68',
                                    optionPrice: 4.0,
                                  ),
                                  ProductOption(
                                    label: 'Especial',
                                    value:
                                        '5cce428c-6900-1234-a235-9a09277eac68',
                                    optionPrice: 5.5,
                                  ),
                                ]),
                                SizedBox(height: 32),
                                SectionTitle('Adicionais'),
                                SizedBox(height: 10),
                                ProductAditionalWidget(
                                  label: 'Bacon',
                                  onChange: () {},
                                  qty: 2,
                                  value: 4.0,
                                ),
                                ProductAditionalWidget(
                                  label: 'Picles',
                                  onChange: () {},
                                  qty: 1,
                                  value: 4.0,
                                ),
                                ProductAditionalWidget(
                                  label: 'Molho Especial',
                                  onChange: () {},
                                  qty: 0,
                                  value: 3.0,
                                ),
                                ProductAditionalWidget(
                                  label: 'Batata Frita',
                                  onChange: () {},
                                  qty: 0,
                                  value: 8.0,
                                ),
                                SizedBox(height: 112),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 65 + MediaQuery.of(context).padding.bottom,
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
          ValueAndAddFooterWidget(
            label: 'Total',
            value: 45.0,
            valueSize: 16,
            onPressed: () {},
          ),
        ],
      ),
    ));
  }
}
