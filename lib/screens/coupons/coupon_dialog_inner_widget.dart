import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:intl/intl.dart';
import 'package:kwik_client_flutter/shared/enums.dart';
import 'package:kwik_client_flutter/utils/theme_utils.dart';
import 'package:kwik_client_flutter/widgets/custom_button_widget.dart';

class CouponDialogInnerWidget extends StatelessWidget {
  final String id;
  final DateTime validUntil;
  final String title;
  final String couponCode;
  final String description;
  final bool isValid;
  final DiscountType couponType;
  final double couponValue;

  const CouponDialogInnerWidget({
    Key key,
    @required this.id,
    @required this.validUntil,
    @required this.title,
    @required this.couponCode,
    @required this.isValid,
    @required this.couponType,
    @required this.couponValue,
    @required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = ThemeUtils.isDark(context);

    var titleColor = isDark ? Color(0xFFDC2F69) : Color(0xFFEE6352);

    void _ativarCupom(String id) {
      Navigator.pop(context);
    }

    return Container(
      height: 375,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(SFSymbols.star_fill, size: 36, color: titleColor),
              Container(
                padding: EdgeInsets.only(top: 3),
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  couponType == DiscountType.PERCENTAGE
                      ? '${couponValue.toStringAsFixed(1).replaceFirst('.0', '')}%'
                      : NumberFormat.simpleCurrency(locale: 'pt_BR')
                          .format(couponValue)
                          .replaceFirst(',00', ''),
                  style: TextStyle(
                    fontSize: 48,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w900,
                    color: titleColor,
                  ),
                ),
              ),
              Icon(SFSymbols.star_fill, size: 36, color: titleColor),
            ],
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: Theme.of(context).errorColor,
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            child: Text(
              couponCode,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Lato'),
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 100,
            child: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Container(
                    child: Center(
                      child: Text(
                        description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.normal,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 14,
            child: Center(
              child: Text(
                'Validade: ${DateFormat('dd/MM/yyyy HH:mm').format(validUntil)} ${isValid ? '' : '(vencido)'}',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.normal,
                  color: isValid ? Color(0xFF3f88c5) : Color(0xFFDC2F69),
                ),
              ),
            ),
          ),
          SizedBox(height: 26),
          CustomButtonWidget(
            buttonText: 'Ativar Cupom',
            buttonType: ButtonType.CANCEL,
            onPressed: () => _ativarCupom(id),
          ),
          SizedBox(height: 16),
          CustomButtonWidget(
            buttonFillType: ButtonFillType.BORDER,
            buttonType: ButtonType.DISABLED,
            buttonText: 'Guardar Para Depois',
            onPressed: () => {
              Navigator.pop(context),
            },
          ),
        ],
      ),
    );
  }
}
