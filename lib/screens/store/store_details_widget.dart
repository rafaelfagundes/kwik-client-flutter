import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kwik_client_flutter/widgets/rounded_store_logo_widget.dart';

class StoreDetailsWidget extends StatefulWidget {
  const StoreDetailsWidget({
    Key key,
  }) : super(key: key);

  @override
  _StoreDetailsWidgetState createState() => _StoreDetailsWidgetState();
}

class _StoreDetailsWidgetState extends State<StoreDetailsWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 750),
    );

    _animation = Tween<Offset>(
      begin: Offset(0, 0.3),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();

    return SlideTransition(
      position: _animation,
      child: Container(
          margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
          padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
          height: 136.0,
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
          child: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 4),
                  Text('McDonald\'s',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 17,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w700,
                      )),
                  SizedBox(height: 5),
                  Text(
                    'Hamburgueria, Milk Shake, Lanches',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 13,
                      color: const Color(0xff7b7b7b),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      // Adobe XD layer: 'StarIcon' (shape)
                      Container(
                        child: Icon(
                          SFSymbols.star_fill,
                          color: Colors.yellow[600],
                          size: 15,
                        ),
                      ),
                      SizedBox(width: 3),
                      Text(
                        '4.8',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 12,
                          color: Theme.of(context).primaryColor,
                          letterSpacing: 0.003,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(width: 3),
                      Text(
                        '(500+)',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 12,
                          color: const Color(0xffa8a8a8),
                          letterSpacing: 0.003,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(width: 10),
                      Container(
                        child: SvgPicture.string(deliveryTimeSVG,
                            allowDrawingOutsideViewBox: true,
                            color: Theme.of(context).primaryColor),
                      ),
                      SizedBox(width: 3),
                      Text(
                        '15-60min',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 12,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(width: 10),
                      Container(
                        child: Icon(
                          SFSymbols.location_fill,
                          color: Theme.of(context).primaryColor,
                          size: 16,
                        ),
                      ),
                      SizedBox(width: 3),
                      Text(
                        '4,7km',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 12,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                right: -4,
                top: -20,
                child: RoundedStoreLogoWidget(
                  size: 64,
                  animationDuration: 100,
                  url:
                      'https://res.cloudinary.com/kardappio/image/upload/v1590475069/hzy36cj4phbearm7wwrc.png',
                ),
              ),
              Positioned(
                right: -2,
                top: 55,
                child: Container(
                  width: 60,
                  height: 16,
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF6BC273), width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  child: Center(
                    child: Text(
                      'ABERTO',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 10,
                        color: Color(0xFF6BC273),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 80,
                width: MediaQuery.of(context).size.width - 64,
                child: Divider(),
              ),
              Positioned(
                top: 80,
                width: MediaQuery.of(context).size.width - 64,
                child: Container(
                  // color: Colors.yellow,
                  height: 50,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Text('Destaques',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 14,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w700,
                            )),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text('Cardápio',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 14,
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(.6),
                              fontWeight: FontWeight.w400,
                            )),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text('Informações',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 14,
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(.6),
                              fontWeight: FontWeight.w400,
                            )),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}

const String starIconSVG =
    '<svg viewBox="33.2 309.0 14.1 13.5" ><path transform="translate(32.0, 320.0)" d="M 3.90234375 2.244140625 C 4.341796875 2.583984375 4.88671875 2.49609375 5.443359375 2.080078125 L 8.2265625 0.03515625 L 11.00390625 2.080078125 C 11.56640625 2.49609375 12.111328125 2.583984375 12.556640625 2.244140625 C 12.99609375 1.916015625 13.083984375 1.365234375 12.8671875 0.732421875 L 11.765625 -2.53125 L 14.56640625 -4.53515625 C 15.123046875 -4.93359375 15.380859375 -5.42578125 15.19921875 -5.953125 C 15.017578125 -6.48046875 14.53125 -6.732421875 13.8515625 -6.7265625 L 10.41796875 -6.697265625 L 9.375 -9.984375 C 9.1640625 -10.640625 8.77734375 -11.02734375 8.2265625 -11.02734375 C 7.67578125 -11.02734375 7.294921875 -10.640625 7.083984375 -9.984375 L 6.03515625 -6.697265625 L 2.595703125 -6.7265625 C 1.927734375 -6.732421875 1.435546875 -6.48046875 1.25390625 -5.96484375 C 1.06640625 -5.42578125 1.330078125 -4.93359375 1.88671875 -4.53515625 L 4.693359375 -2.53125 L 3.591796875 0.732421875 C 3.369140625 1.365234375 3.462890625 1.916015625 3.90234375 2.244140625 Z" fill="#ffd166" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String deliveryTimeSVG =
    '<svg viewBox="115.0 311.0 16.0 13.0" ><path transform="translate(1785.0, 484.51)" d="M -1665.223266601562 -162.5184020996094 L -1667.255493164062 -162.5184020996094 C -1667.815185546875 -162.5184020996094 -1668.268798828125 -162.9720001220703 -1668.268798828125 -163.5317993164062 C -1668.268798828125 -164.0906982421875 -1667.815185546875 -164.5443115234375 -1667.255493164062 -164.5443115234375 L -1666.53271484375 -164.5443115234375 C -1666.767700195312 -165.1212005615234 -1666.922485351562 -165.739501953125 -1666.983642578125 -166.3857116699219 L -1668.987060546875 -166.3857116699219 C -1669.546875 -166.3857116699219 -1670.00048828125 -166.8393096923828 -1670.00048828125 -167.3982086181641 C -1670.00048828125 -167.9580078125 -1669.546875 -168.4107055664062 -1668.987060546875 -168.4107055664062 L -1666.858520507812 -168.4107055664062 C -1666.713623046875 -169.0677032470703 -1666.468872070312 -169.6869049072266 -1666.14208984375 -170.2521057128906 L -1667.8583984375 -170.2521057128906 C -1668.418212890625 -170.2521057128906 -1668.870971679688 -170.7057037353516 -1668.870971679688 -171.2655029296875 C -1668.870971679688 -171.8244018554688 -1668.418212890625 -172.2779998779297 -1667.8583984375 -172.2779998779297 L -1664.310668945312 -172.2779998779297 C -1663.236083984375 -173.0538024902344 -1661.915771484375 -173.5101013183594 -1660.48828125 -173.5065002441406 C -1656.893798828125 -173.4965972900391 -1654.000244140625 -170.5950012207031 -1654.000244140625 -167.0003967285156 C -1654.000244140625 -163.4067077636719 -1656.91259765625 -160.493408203125 -1660.50634765625 -160.493408203125 C -1662.363037109375 -160.493408203125 -1664.037963867188 -161.2718963623047 -1665.223266601562 -162.5184020996094 Z M -1665.456298828125 -167.0003967285156 C -1665.456298828125 -164.2707061767578 -1663.236083984375 -162.0494995117188 -1660.50634765625 -162.0494995117188 C -1657.776611328125 -162.0494995117188 -1655.556396484375 -164.2707061767578 -1655.556396484375 -167.0003967285156 C -1655.556396484375 -169.7292022705078 -1657.776611328125 -171.9504089355469 -1660.50634765625 -171.9504089355469 C -1663.236083984375 -171.9504089355469 -1665.456298828125 -169.7292022705078 -1665.456298828125 -167.0003967285156 Z M -1664.5185546875 -167.0003967285156 C -1664.5185546875 -169.2126007080078 -1662.718505859375 -171.0126037597656 -1660.50634765625 -171.0126037597656 C -1658.294189453125 -171.0126037597656 -1656.493286132812 -169.2126007080078 -1656.493286132812 -167.0003967285156 C -1656.493286132812 -164.7873077392578 -1658.294189453125 -162.9873046875 -1660.50634765625 -162.9873046875 C -1662.718505859375 -162.9873046875 -1664.5185546875 -164.7873077392578 -1664.5185546875 -167.0003967285156 Z M -1660.975219726562 -166.5315093994141 L -1658.614501953125 -166.5315093994141 L -1658.614501953125 -167.4683990478516 L -1660.037475585938 -167.4683990478516 L -1660.037475585938 -169.8218994140625 L -1660.975219726562 -169.8218994140625 L -1660.975219726562 -166.5315093994141 Z" fill="#440044" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
