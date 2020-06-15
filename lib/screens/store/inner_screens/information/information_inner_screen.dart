import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/screens/store/inner_screens/information/credit_cards_list_widget.dart';
import 'package:kwik_client_flutter/screens/store/inner_screens/information/working_hours_table_widget.dart';
import 'package:kwik_client_flutter/utils/theme_utils.dart';

class InformationInner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Divider(),
          SizedBox(height: 19),
          SectionTitle('Sobre'),
          SizedBox(height: 10),
          Text(
            'Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.',
            style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Theme.of(context).primaryColor,
                height: 1.35),
          ),
          SizedBox(height: 32),
          SectionTitle('Formas de Pagamento'),
          SizedBox(height: 16),
          SectionSubTitle('Cartão de Crédito / Débito'),
          SizedBox(height: 10),
          CreditCardsList(),
          SizedBox(height: 16),
          SectionSubTitle('Dinheiro'),
          SizedBox(height: 10),
          Text(
            'Aceita dinheiro em espécie. Lembre-se de informar o troco, caso necessário, ao efetuar o pedido.',
            style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Theme.of(context).primaryColor,
                height: 1.35),
          ),
          SizedBox(height: 32),
          SectionTitle('Horários de Funcionamento'),
          SizedBox(height: 16),
          WorkingHoursTableWidget(),
          SizedBox(height: 72),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle(
    this.title, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = ThemeUtils.isDark(context);
    return Text(
      title.toUpperCase(),
      style: TextStyle(
        fontFamily: 'Lato',
        fontSize: 13,
        fontWeight: FontWeight.w900,
        color: isDark ? Color(0xffB0B0B0) : Color(0xff7B7B7B),
      ),
    );
  }
}

class SectionSubTitle extends StatelessWidget {
  final String title;

  const SectionSubTitle(
    this.title, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title.toUpperCase(),
      style: TextStyle(
        fontFamily: 'Lato',
        fontSize: 11,
        fontWeight: FontWeight.w900,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
