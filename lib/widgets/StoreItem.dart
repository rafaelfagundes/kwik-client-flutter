import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StoreItem extends StatelessWidget {
  StoreItem({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 200.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: const Color(0xffffffff),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x0d000000),
                  offset: Offset(0, 8),
                  blurRadius: 16,
                ),
              ],
            ),
          ),
          // Adobe XD layer: 'StoreBanner' (shape)
          Container(
            width: double.infinity,
            height: 100.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
              image: DecorationImage(
                image: const AssetImage('assets/images/StoreBanner.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(MediaQuery.of(context).size.width - 110, 68.0),
            child:
                // Adobe XD layer: 'StoreLogo' (shape)
                Container(
              width: 64.0,
              height: 64.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.elliptical(32.0, 32.0)),
                image: DecorationImage(
                  image: const AssetImage('assets/images/StoreLogo.png'),
                  fit: BoxFit.cover,
                ),
                border: Border.all(width: 2.0, color: const Color(0xffffffff)),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x0d000000),
                    offset: Offset(0, 4),
                    blurRadius: 16,
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(-16.0, -137.0),
            child:
                // Adobe XD layer: 'StoreInfo' (group)
                Stack(
              children: <Widget>[
                Transform.translate(
                  offset: Offset(16.0, 237.0),
                  child: Container(
                    width: double.infinity,
                    height: 100.0,
                    decoration: BoxDecoration(),
                  ),
                ),
                // Adobe XD layer: 'StoreData' (group)
                Stack(
                  children: <Widget>[
                    Transform.translate(
                      offset: Offset(32.0, 228.0),
                      child:
                          // Adobe XD layer: 'StoreStatus' (text)
                          Text(
                        'ABERTO',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 10,
                          color: const Color(0xff6bc273),
                          letterSpacing: 0.0025,
                          fontWeight: FontWeight.w700,
                          height: 3.6,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(32.0, 249.0),
                      child:
                          // Adobe XD layer: 'StoreName' (text)
                          Text(
                        'McDonald\'s',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 17,
                          color: const Color(0xff440044),
                          letterSpacing: 0.00425,
                          fontWeight: FontWeight.w700,
                          height: 2.1176470588235294,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(32.0, 268.0),
                      child:
                          // Adobe XD layer: 'StoreSpecialties' (text)
                          Container(
                        padding: EdgeInsets.only(right: 32),
                        child: Text(
                          'Hamburgueria, Milk Shake, Lanches, Hamburgueria, Milk Shake, Lanches',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 13,
                            color: const Color(0xff7b7b7b),
                            letterSpacing: 0.0032500000000000003,
                            fontWeight: FontWeight.w700,
                            height: 2.769230769230769,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ],
                ),
                // Adobe XD layer: 'Rating' (group)
                Transform.translate(
                  offset: Offset(33.19, 292),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      // Adobe XD layer: 'StarIcon' (shape)
                      Container(
                        padding: EdgeInsets.only(top: 12),
                        child: SvgPicture.string(
                          _svg_noz4np,
                          allowDrawingOutsideViewBox: true,
                        ),
                      ),
                      SizedBox(width: 3),
                      Text(
                        '4.8',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 12,
                          color: const Color(0xff440044),
                          letterSpacing: 0.003,
                          fontWeight: FontWeight.w700,
                          height: 3,
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
                          height: 3,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(width: 10),
                      Container(
                        padding: EdgeInsets.only(top: 15),
                        child: SvgPicture.string(
                          _svg_jslkou,
                          allowDrawingOutsideViewBox: true,
                        ),
                      ),
                      SizedBox(width: 3),
                      Text(
                        '15-60min',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 12,
                          color: const Color(0xff7b7b7b),
                          letterSpacing: 0.003,
                          fontWeight: FontWeight.w700,
                          height: 3,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),

                // Stack(
                //   children: <Widget>[
                //     Transform.translate(
                //       offset: Offset(33.19, 308.97),
                //       child:
                //           // Adobe XD layer: 'StarIcon' (shape)
                //           SvgPicture.string(
                //         _svg_noz4np,
                //         allowDrawingOutsideViewBox: true,
                //       ),
                //     ),
                //     Transform.translate(
                //       offset: Offset(53.0, 291.0),
                //       child:
                //           // Adobe XD layer: 'RatingValue' (text)
                //           Text(
                //         '4.8',
                //         style: TextStyle(
                //           fontFamily: 'Lato',
                //           fontSize: 12,
                //           color: const Color(0xff440044),
                //           letterSpacing: 0.003,
                //           fontWeight: FontWeight.w700,
                //           height: 3,
                //         ),
                //         textAlign: TextAlign.left,
                //       ),
                //     ),
                //     Transform.translate(
                //       offset: Offset(75.0, 291.0),
                //       child:
                //           // Adobe XD layer: 'RatingCount' (text)
                //           Text(
                //         '(500+)',
                //         style: TextStyle(
                //           fontFamily: 'Lato',
                //           fontSize: 12,
                //           color: const Color(0xffa8a8a8),
                //           letterSpacing: 0.003,
                //           height: 3,
                //         ),
                //         textAlign: TextAlign.left,
                //       ),
                //     ),
                //   ],
                // ),
                // Transform.translate(
                //   offset: Offset(5.0, 0.0),
                //   child:
                //       // Adobe XD layer: 'DeliveryTIme' (group)
                //       Stack(
                //     children: <Widget>[
                //       Transform.translate(
                //         offset: Offset(136.0, 291.0),
                //         child:
                //             // Adobe XD layer: 'DeliveryTimeText' (text)
                //             Text(
                //           '15-60min',
                //           style: TextStyle(
                //             fontFamily: 'Lato',
                //             fontSize: 12,
                //             color: const Color(0xff7b7b7b),
                //             letterSpacing: 0.003,
                //             fontWeight: FontWeight.w700,
                //             height: 3,
                //           ),
                //           textAlign: TextAlign.left,
                //         ),
                //       ),
                //       Transform.translate(
                //         offset: Offset(115.0, 311.0),
                //         child:
                //             // Adobe XD layer: 'DeliveryTimeIcon' (shape)
                //             SvgPicture.string(
                //           _svg_jslkou,
                //           allowDrawingOutsideViewBox: true,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_noz4np =
    '<svg viewBox="33.2 309.0 14.1 13.5" ><path transform="translate(32.0, 320.0)" d="M 3.90234375 2.244140625 C 4.341796875 2.583984375 4.88671875 2.49609375 5.443359375 2.080078125 L 8.2265625 0.03515625 L 11.00390625 2.080078125 C 11.56640625 2.49609375 12.111328125 2.583984375 12.556640625 2.244140625 C 12.99609375 1.916015625 13.083984375 1.365234375 12.8671875 0.732421875 L 11.765625 -2.53125 L 14.56640625 -4.53515625 C 15.123046875 -4.93359375 15.380859375 -5.42578125 15.19921875 -5.953125 C 15.017578125 -6.48046875 14.53125 -6.732421875 13.8515625 -6.7265625 L 10.41796875 -6.697265625 L 9.375 -9.984375 C 9.1640625 -10.640625 8.77734375 -11.02734375 8.2265625 -11.02734375 C 7.67578125 -11.02734375 7.294921875 -10.640625 7.083984375 -9.984375 L 6.03515625 -6.697265625 L 2.595703125 -6.7265625 C 1.927734375 -6.732421875 1.435546875 -6.48046875 1.25390625 -5.96484375 C 1.06640625 -5.42578125 1.330078125 -4.93359375 1.88671875 -4.53515625 L 4.693359375 -2.53125 L 3.591796875 0.732421875 C 3.369140625 1.365234375 3.462890625 1.916015625 3.90234375 2.244140625 Z" fill="#ffd166" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_jslkou =
    '<svg viewBox="115.0 311.0 16.0 13.0" ><path transform="translate(1785.0, 484.51)" d="M -1665.223266601562 -162.5184020996094 L -1667.255493164062 -162.5184020996094 C -1667.815185546875 -162.5184020996094 -1668.268798828125 -162.9720001220703 -1668.268798828125 -163.5317993164062 C -1668.268798828125 -164.0906982421875 -1667.815185546875 -164.5443115234375 -1667.255493164062 -164.5443115234375 L -1666.53271484375 -164.5443115234375 C -1666.767700195312 -165.1212005615234 -1666.922485351562 -165.739501953125 -1666.983642578125 -166.3857116699219 L -1668.987060546875 -166.3857116699219 C -1669.546875 -166.3857116699219 -1670.00048828125 -166.8393096923828 -1670.00048828125 -167.3982086181641 C -1670.00048828125 -167.9580078125 -1669.546875 -168.4107055664062 -1668.987060546875 -168.4107055664062 L -1666.858520507812 -168.4107055664062 C -1666.713623046875 -169.0677032470703 -1666.468872070312 -169.6869049072266 -1666.14208984375 -170.2521057128906 L -1667.8583984375 -170.2521057128906 C -1668.418212890625 -170.2521057128906 -1668.870971679688 -170.7057037353516 -1668.870971679688 -171.2655029296875 C -1668.870971679688 -171.8244018554688 -1668.418212890625 -172.2779998779297 -1667.8583984375 -172.2779998779297 L -1664.310668945312 -172.2779998779297 C -1663.236083984375 -173.0538024902344 -1661.915771484375 -173.5101013183594 -1660.48828125 -173.5065002441406 C -1656.893798828125 -173.4965972900391 -1654.000244140625 -170.5950012207031 -1654.000244140625 -167.0003967285156 C -1654.000244140625 -163.4067077636719 -1656.91259765625 -160.493408203125 -1660.50634765625 -160.493408203125 C -1662.363037109375 -160.493408203125 -1664.037963867188 -161.2718963623047 -1665.223266601562 -162.5184020996094 Z M -1665.456298828125 -167.0003967285156 C -1665.456298828125 -164.2707061767578 -1663.236083984375 -162.0494995117188 -1660.50634765625 -162.0494995117188 C -1657.776611328125 -162.0494995117188 -1655.556396484375 -164.2707061767578 -1655.556396484375 -167.0003967285156 C -1655.556396484375 -169.7292022705078 -1657.776611328125 -171.9504089355469 -1660.50634765625 -171.9504089355469 C -1663.236083984375 -171.9504089355469 -1665.456298828125 -169.7292022705078 -1665.456298828125 -167.0003967285156 Z M -1664.5185546875 -167.0003967285156 C -1664.5185546875 -169.2126007080078 -1662.718505859375 -171.0126037597656 -1660.50634765625 -171.0126037597656 C -1658.294189453125 -171.0126037597656 -1656.493286132812 -169.2126007080078 -1656.493286132812 -167.0003967285156 C -1656.493286132812 -164.7873077392578 -1658.294189453125 -162.9873046875 -1660.50634765625 -162.9873046875 C -1662.718505859375 -162.9873046875 -1664.5185546875 -164.7873077392578 -1664.5185546875 -167.0003967285156 Z M -1660.975219726562 -166.5315093994141 L -1658.614501953125 -166.5315093994141 L -1658.614501953125 -167.4683990478516 L -1660.037475585938 -167.4683990478516 L -1660.037475585938 -169.8218994140625 L -1660.975219726562 -169.8218994140625 L -1660.975219726562 -166.5315093994141 Z" fill="#440044" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
