import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:intl/intl.dart';
import 'package:kwik_client_flutter/models/product_option_model.dart';
import 'package:kwik_client_flutter/widgets/section_subtitle_widget.dart';

class OptionWidget extends StatefulWidget {
  final String title;
  final List<ProductOption> items;

  const OptionWidget({
    Key key,
    @required this.title,
    this.items,
  }) : super(key: key);

  @override
  _OptionWidgetState createState() => _OptionWidgetState();
}

class _OptionWidgetState extends State<OptionWidget> {
  String selectedOption;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedOption = widget.items[0].value;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SectionSubTitle(widget.title),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: Theme.of(context).cardColor,
            boxShadow: [
              BoxShadow(
                blurRadius: 8,
                offset: Offset(0, 4),
                color: Colors.black.withOpacity(0.05),
              ),
            ],
          ),
          child: DropdownButton<String>(
            isExpanded: true,
            value: selectedOption,
            underline: Container(),
            icon: Icon(SFSymbols.chevron_down),
            iconSize: 16,
            // elevation: 16,
            style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 14,
                color: Theme.of(context).primaryColor),
            onChanged: (String newValue) {
              setState(() {
                selectedOption = newValue;
              });
            },
            items: widget.items.map((ProductOption item) {
              return DropdownMenuItem<String>(
                value: item.value,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(item.label),
                    Padding(
                      padding: const EdgeInsets.only(right: 6.0),
                      child: Text(
                        '+ ' +
                            NumberFormat.simpleCurrency(locale: 'pt_BR')
                                .format(item.optionPrice),
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: item.optionPrice == 0
                              ? Color(0xffC4C4C4)
                              : Color(0xff6BC273),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
