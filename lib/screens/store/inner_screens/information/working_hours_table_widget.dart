import 'package:flutter/material.dart';
import 'package:kwik_client_flutter/utils/theme_utils.dart';

class WorkingHoursTableWidget extends StatelessWidget {
  const WorkingHoursTableWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        DayLine(day: 'Domingo', openHours: '08:00 - 12:00 / 14:00 - 18:00'),
        DayLine(
            day: 'Segunda-Feira', openHours: '08:00 - 12:00 / 14:00 - 18:00'),
        DayLine(day: 'Terça-Feira', openHours: '08:00 - 12:00 / 14:00 - 18:00'),
        DayLine(
            day: 'Quarta-Feira', openHours: '08:00 - 12:00 / 14:00 - 18:00'),
        DayLine(
            day: 'Quinta-Feira', openHours: '08:00 - 12:00 / 14:00 - 18:00'),
        DayLine(day: 'Sexta-Feira', openHours: '08:00 - 12:00 / 14:00 - 18:00'),
        DayLine(day: 'Sábado', openHours: '08:00 - 12:00 / 14:00 - 18:00'),
      ],
    );
  }
}

class DayLine extends StatelessWidget {
  final String day;
  final String openHours;

  const DayLine({
    Key key,
    this.day,
    this.openHours,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = ThemeUtils.isDark(context);
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            day.toUpperCase(),
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 11,
              fontWeight: FontWeight.w900,
              color: Theme.of(context).primaryColor,
            ),
          ),
          Text(
            openHours,
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: isDark ? Color(0xffB0B0B0) : Color(0xff7B7B7B),
            ),
          )
        ],
      ),
    );
  }
}
