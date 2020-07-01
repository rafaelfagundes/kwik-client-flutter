import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:kwik_client_flutter/utils/core_utils.dart';
import 'package:kwik_client_flutter/widgets/custom_text_field.dart';
import 'package:kwik_client_flutter/widgets/label_and_switch_widget.dart';

import 'custom_icon_widget.dart';

class StopAddress {
  final String address;
  final String icon;

  StopAddress(this.address, this.icon);
}

class ListAdressesWidget extends StatelessWidget {
  const ListAdressesWidget({
    Key key,
    @required this.paddingTop,
    @required this.backgroundHeight,
    @required this.width,
    @required this.stopAdresses,
    @required this.addAddress,
    @required this.removeAddress,
    @required this.toggleSummary,
  }) : super(key: key);

  final double paddingTop;
  final double backgroundHeight;
  final double width;
  final List<StopAddress> stopAdresses;
  final Function addAddress;
  final Function removeAddress;
  final Function toggleSummary;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: paddingTop + backgroundHeight,
        width: width,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor.withOpacity(.95),
        ),
        padding: EdgeInsets.only(
            top: paddingTop + 20, left: 12, right: 16, bottom: 16),
        child: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(height: 9),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    SFSymbols.chevron_left,
                    color: Theme.of(context).primaryColor,
                    size: 24,
                  ),
                )
              ],
            ),
            Column(
              children: <Widget>[
                AddressLine(
                    label: 'Partida', iconName: 'start', onChanged: null),
                AddressSeparator(
                    addAddress: () => addAddress(0),
                    showAddButton: stopAdresses.length < 3),
                SizedBox(height: 2),
                ...stopAdresses.mapIndexed((address, index) {
                  return Column(children: <Widget>[
                    AddressLine(
                        label: address.address,
                        iconName: address.icon,
                        onChanged: null,
                        showDeleteButton: true,
                        onDeleted: () => removeAddress(index)),
                    AddressSeparator(
                        addAddress: () => addAddress(index + 1),
                        showAddButton: stopAdresses.length < 3),
                    SizedBox(height: 2),
                  ]);
                }),
                AddressLine(
                  label: 'Destino',
                  iconName: 'end',
                  onChanged: null,
                  textInputAction: TextInputAction.search,
                  onEditingComplete: toggleSummary,
                ),
                Container(
                  // color: Colors.yellow,
                  width: width - 132,
                  margin: EdgeInsets.only(left: 24),
                  child: LabelAndSwitchWidget(
                    label: 'Ida e Volta',
                    value: false,
                    hasPadding: false,
                    onChanged: (value) {},
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class AddressSeparator extends StatelessWidget {
  final Function addAddress;
  final bool showAddButton;

  const AddressSeparator({
    Key key,
    @required this.addAddress,
    @required this.showAddButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      child: Row(children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 15),
          height: 26,
          child: Center(
            child: Icon(
              SFSymbols.ellipsis_vertical,
              size: 22,
              color: Theme.of(context).primaryColor.withOpacity(.5),
            ),
          ),
        ),
        SizedBox(width: width - 115),
        if (showAddButton)
          Container(
            height: 26,
            width: 26,
            child: Center(
              child: GestureDetector(
                onTap: addAddress,
                child: CustomIconWidget(
                  name: 'add_stop',
                  size: 22,
                ),
              ),
            ),
          ),
        if (!showAddButton) SizedBox(width: 26)
      ]),
    );
  }
}

class AddressLine extends StatelessWidget {
  final String iconName;
  final String label;
  final Function onChanged;
  final bool showDeleteButton;
  final Function onDeleted;
  final Function onEditingComplete;
  final TextInputAction textInputAction;

  const AddressLine({
    Key key,
    @required this.iconName,
    @required this.label,
    @required this.onChanged,
    this.showDeleteButton = false,
    this.onDeleted,
    this.textInputAction,
    this.onEditingComplete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      child: Row(
        children: <Widget>[
          SizedBox(width: 16),
          CustomIconWidget(name: iconName),
          SizedBox(width: 16),
          Stack(
            children: <Widget>[
              Container(
                width: width - 38 - 48 - 48,
                height: 65,
                child: CustomTextField(
                  labelText: label,
                  onChanged: onChanged,
                  textInputAction: textInputAction,
                  onEditingComplete: onEditingComplete,
                ),
              ),
              if (showDeleteButton)
                Positioned(
                  right: 10,
                  top: 18,
                  child: GestureDetector(
                    onTap: onDeleted,
                    child: Icon(
                      SFSymbols.xmark_circle_fill,
                      color: Color(0xffEA4335),
                      size: 22,
                    ),
                  ),
                )
            ],
          ),
          SizedBox(width: 32),
        ],
      ),
    );
  }
}
