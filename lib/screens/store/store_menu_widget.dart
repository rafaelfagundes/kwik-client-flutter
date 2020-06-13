import 'package:flutter/material.dart';

class StoreMenuWidget extends StatelessWidget {
  final Function onChangeScreen;
  final int index;

  const StoreMenuWidget(
      {Key key, @required this.onChangeScreen, @required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              onChangeScreen(0);
            },
            child: Container(
              color: Colors.transparent,
              height: 50,
              child: Center(
                child: Text('Destaques',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 14,
                      color: index == 0
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).primaryColor.withOpacity(.6),
                      fontWeight:
                          index == 0 ? FontWeight.w700 : FontWeight.w400,
                    )),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              onChangeScreen(1);
            },
            child: Container(
              height: 50,
              color: Colors.transparent,
              child: Center(
                child: Text('Cardápio',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 14,
                      color: index == 1
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).primaryColor.withOpacity(.6),
                      fontWeight:
                          index == 1 ? FontWeight.w700 : FontWeight.w400,
                    )),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              onChangeScreen(2);
            },
            child: Container(
              height: 50,
              color: Colors.transparent,
              child: Center(
                child: Text('Avaliações',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 14,
                      color: index == 2
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).primaryColor.withOpacity(.6),
                      fontWeight:
                          index == 2 ? FontWeight.w700 : FontWeight.w400,
                    )),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              onChangeScreen(3);
            },
            child: Container(
              height: 50,
              color: Colors.transparent,
              child: Center(
                child: Text('Informações',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 14,
                      color: index == 3
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).primaryColor.withOpacity(.6),
                      fontWeight:
                          index == 3 ? FontWeight.w700 : FontWeight.w400,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
