import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:kwik_client_flutter/screen_arguments/product_arguments.dart';
import 'package:kwik_client_flutter/shared/enums.dart';
import 'package:kwik_client_flutter/widgets/custom_button_widget.dart';
import 'package:kwik_client_flutter/widgets/integer_qty_widget.dart';
import 'package:kwik_client_flutter/widgets/section_title_widget.dart';
import 'package:kwik_client_flutter/widgets/total_value_widget.dart';

import 'aditional_widget.dart';
import 'option_widget.dart';
import 'product_header_widget.dart';

class Product extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> with SingleTickerProviderStateMixin {
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
                                  maxLines: 5,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 32),
                                SectionTitle('Opções'),
                                SizedBox(height: 10),
                                OptionWidget(
                                    label: 'Light',
                                    groupValue: false,
                                    onChange: null,
                                    value: true,
                                    optionValue: 15),
                                OptionWidget(
                                    label: 'Normal',
                                    groupValue: 'Normal' == 'Normal',
                                    onChange: null,
                                    value: true,
                                    optionValue: 17.40),
                                OptionWidget(
                                    label: 'Duplo',
                                    groupValue: true,
                                    onChange: null,
                                    value: false,
                                    optionValue: 20.99),
                                SizedBox(height: 32),
                                SectionTitle('Adicionais'),
                                SizedBox(height: 10),
                                AditionalWidget(
                                  label: 'Bacon',
                                  onChange: () {},
                                  qty: 2,
                                  value: 4.0,
                                ),
                                AditionalWidget(
                                  label: 'Picles',
                                  onChange: () {},
                                  qty: 1,
                                  value: 4.0,
                                ),
                                AditionalWidget(
                                  label: 'Molho Especial',
                                  onChange: () {},
                                  qty: 0,
                                  value: 3.0,
                                ),
                                AditionalWidget(
                                  label: 'Batata Frita',
                                  onChange: () {},
                                  qty: 0,
                                  value: 8.0,
                                ),
                                SizedBox(height: 32),
                                SectionTitle('Quantidade'),
                                SizedBox(height: 10),
                                IntegerQtyWidget(
                                  value: _productQty,
                                  onChange: _onChange,
                                  min: 1,
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

class ValueAndAddFooterWidget extends StatelessWidget {
  final String label;
  final double value;
  final double valueSize;
  final Function onPressed;

  const ValueAndAddFooterWidget(
      {Key key,
      @required this.label,
      @required this.value,
      @required this.valueSize,
      @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        height: 65,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            boxShadow: [
              BoxShadow(
                  blurRadius: 8,
                  offset: Offset(0, 0),
                  color: Colors.black.withOpacity(.05))
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            TotalValueWidget(
              label: label,
              value: value,
              valueSize: valueSize,
            ),
            Container(
              width: 210,
              child: CustomButtonWidget(
                buttonType: ButtonType.CONFIRMATION,
                buttonText: 'Adicionar ao Carrinho',
                onPressed: onPressed,
                icon: SFSymbols.cart_badge_plus,
                verticalIconAjustment: -0.75,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
