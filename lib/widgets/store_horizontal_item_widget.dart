import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kwik_client_flutter/screen_arguments/store_arguments.dart';
import 'package:kwik_client_flutter/utils/theme_utils.dart';

import 'rounded_store_logo_widget.dart';

class StoreHorizontalItemWidget extends StatelessWidget {
  final String id;
  final String title;
  final double rating;
  final List<int> deliveryTimes;
  final String logo;
  final bool recentlyViewed;

  const StoreHorizontalItemWidget(
      {@required Key key,
      @required this.id,
      @required this.title,
      @required this.rating,
      @required this.deliveryTimes,
      @required this.logo,
      this.recentlyViewed = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = ThemeUtils.isDark(context);

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/store',
            arguments: StoreArguments(
                id: recentlyViewed ? 'recent_' + id : id, logo: logo));
      },
      child: Container(
        margin: EdgeInsets.only(right: 10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: 115,
                  height: 160,
                  decoration: BoxDecoration(
                    color: isDark ? Color(0xff232323) : Color(0xfff5f5f5),
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                ),
                Container(
                  width: 115,
                  height: 160,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      RoundedStoreLogoWidget(
                        size: 72,
                        animationDuration: 100,
                        url: logo,
                        heroId: recentlyViewed ? 'recent_' + id : id,
                      ),
                      SizedBox(height: 3),
                      Container(
                        height: 40,
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Center(
                          child: Container(
                            child: Text(
                              title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                height: 1.2,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 3),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Icon(
                              SFSymbols.star_fill,
                              size: 14,
                              color: Colors.yellow[700],
                            ),
                          ),
                          SizedBox(width: 2),
                          Container(
                            margin: EdgeInsets.only(top: 2),
                            child: Text(rating.toStringAsPrecision(2),
                                style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700)),
                          ),
                          SizedBox(width: 7),
                          Container(
                            padding: EdgeInsets.only(top: 2),
                            width: 15,
                            height: 15,
                            child: SvgPicture.string(deliveryTimeSVG,
                                allowDrawingOutsideViewBox: true,
                                color: Theme.of(context).primaryColor),
                          ),
                          SizedBox(width: 2),
                          Container(
                            margin: EdgeInsets.only(top: 2),
                            child: Text(
                                '${deliveryTimes[0]}-${deliveryTimes[1]}"',
                                style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700)),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

const String deliveryTimeSVG =
    '<svg viewBox="115.0 311.0 16.0 13.0" ><path transform="translate(1785.0, 484.51)" d="M -1665.223266601562 -162.5184020996094 L -1667.255493164062 -162.5184020996094 C -1667.815185546875 -162.5184020996094 -1668.268798828125 -162.9720001220703 -1668.268798828125 -163.5317993164062 C -1668.268798828125 -164.0906982421875 -1667.815185546875 -164.5443115234375 -1667.255493164062 -164.5443115234375 L -1666.53271484375 -164.5443115234375 C -1666.767700195312 -165.1212005615234 -1666.922485351562 -165.739501953125 -1666.983642578125 -166.3857116699219 L -1668.987060546875 -166.3857116699219 C -1669.546875 -166.3857116699219 -1670.00048828125 -166.8393096923828 -1670.00048828125 -167.3982086181641 C -1670.00048828125 -167.9580078125 -1669.546875 -168.4107055664062 -1668.987060546875 -168.4107055664062 L -1666.858520507812 -168.4107055664062 C -1666.713623046875 -169.0677032470703 -1666.468872070312 -169.6869049072266 -1666.14208984375 -170.2521057128906 L -1667.8583984375 -170.2521057128906 C -1668.418212890625 -170.2521057128906 -1668.870971679688 -170.7057037353516 -1668.870971679688 -171.2655029296875 C -1668.870971679688 -171.8244018554688 -1668.418212890625 -172.2779998779297 -1667.8583984375 -172.2779998779297 L -1664.310668945312 -172.2779998779297 C -1663.236083984375 -173.0538024902344 -1661.915771484375 -173.5101013183594 -1660.48828125 -173.5065002441406 C -1656.893798828125 -173.4965972900391 -1654.000244140625 -170.5950012207031 -1654.000244140625 -167.0003967285156 C -1654.000244140625 -163.4067077636719 -1656.91259765625 -160.493408203125 -1660.50634765625 -160.493408203125 C -1662.363037109375 -160.493408203125 -1664.037963867188 -161.2718963623047 -1665.223266601562 -162.5184020996094 Z M -1665.456298828125 -167.0003967285156 C -1665.456298828125 -164.2707061767578 -1663.236083984375 -162.0494995117188 -1660.50634765625 -162.0494995117188 C -1657.776611328125 -162.0494995117188 -1655.556396484375 -164.2707061767578 -1655.556396484375 -167.0003967285156 C -1655.556396484375 -169.7292022705078 -1657.776611328125 -171.9504089355469 -1660.50634765625 -171.9504089355469 C -1663.236083984375 -171.9504089355469 -1665.456298828125 -169.7292022705078 -1665.456298828125 -167.0003967285156 Z M -1664.5185546875 -167.0003967285156 C -1664.5185546875 -169.2126007080078 -1662.718505859375 -171.0126037597656 -1660.50634765625 -171.0126037597656 C -1658.294189453125 -171.0126037597656 -1656.493286132812 -169.2126007080078 -1656.493286132812 -167.0003967285156 C -1656.493286132812 -164.7873077392578 -1658.294189453125 -162.9873046875 -1660.50634765625 -162.9873046875 C -1662.718505859375 -162.9873046875 -1664.5185546875 -164.7873077392578 -1664.5185546875 -167.0003967285156 Z M -1660.975219726562 -166.5315093994141 L -1658.614501953125 -166.5315093994141 L -1658.614501953125 -167.4683990478516 L -1660.037475585938 -167.4683990478516 L -1660.037475585938 -169.8218994140625 L -1660.975219726562 -169.8218994140625 L -1660.975219726562 -166.5315093994141 Z" fill="#440044" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
