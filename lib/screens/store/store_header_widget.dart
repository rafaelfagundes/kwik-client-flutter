import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';

import 'shadow_widget.dart';
import 'store_details_widget.dart';

class StoreHeaderWidget extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final double collapsedHeight;
  final String title;
  final String heroId;
  final String logo;
  final String banner;
  final bool isOpen;

  StoreHeaderWidget({
    @required this.expandedHeight,
    @required this.collapsedHeight,
    @required this.title,
    @required this.heroId,
    @required this.logo,
    this.isOpen = false,
    this.banner,
  });

  double _getHeaderOpacity(double shrinkOffset) {
    if (shrinkOffset > 75) {
      // X is how much the opacity will decrease
      double x = shrinkOffset - 75;
      double opacity = (100 - x * 5) / 100;
      if (opacity < 0) {
        return 0;
      } else {
        return opacity;
      }
    } else {
      return 1;
    }
  }

  double _getHeaderTitle(shrinkOffset, expandedHeight) {
    double result = shrinkOffset / (expandedHeight / 3);

    if (result < 1) {
      return result;
    } else {
      return 1.0;
    }
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // print('expandedHeight ${expandedHeight}');
    // print('shrinkOffset ${shrinkOffset}');

    return Stack(
      fit: StackFit.loose,
      overflow: Overflow.visible,
      children: [
        Hero(
          tag: banner != null ? banner : 'N/D',
          transitionOnUserGestures: true,
          child: Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              banner != null
                  ? banner
                  : 'https://res.cloudinary.com/kardappio/image/upload/c_scale,q_auto:low,w_1080/v1591753846/kwik/assets/examples/dan-gold-E6HjQaB7UEA-unsplash.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: (200 - 18.0) - shrinkOffset,
          width: MediaQuery.of(context).size.width,
          child: Opacity(
            opacity: _getHeaderOpacity(shrinkOffset),
            child:
                StoreDetailsWidget(logo: logo, heroId: heroId, isOpen: isOpen),
          ),
        ),
        Positioned(
          top: 0,
          height: MediaQuery.of(context).padding.top + 52,
          width: MediaQuery.of(context).size.width,
          child: ShadowWidget(),
        ),
        Positioned(
          top: MediaQuery.of(context).padding.top,
          width: MediaQuery.of(context).size.width,
          height: 48,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                      icon: Icon(SFSymbols.chevron_left, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  Opacity(
                    opacity: _getHeaderTitle(shrinkOffset, expandedHeight),
                    child: Text(
                      title,
                      style: TextStyle(
                          shadows: [
                            Shadow(
                              blurRadius: 6.0,
                              color: Colors.black,
                              offset: Offset(0, 0),
                            ),
                          ],
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          fontFamily: 'Lato'),
                    ),
                  ),
                  IconButton(
                      icon: Icon(SFSymbols.heart, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  // double get minExtent => kToolbarHeight;
  double get minExtent => collapsedHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
