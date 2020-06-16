import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:kwik_client_flutter/shared/enums.dart';
import 'package:kwik_client_flutter/widgets/statusbar_shadow_widget.dart';

import 'product_details_widget.dart';

class ProductHeaderWidget extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final double collapsedHeight;
  final String title;
  final String heroId;
  final String logo;
  final String banner;
  final bool hasDiscount;
  final double oldValue;
  final double value;
  final double discountValue;
  final DiscountType discountType;

  ProductHeaderWidget({
    @required this.discountValue,
    @required this.discountType,
    @required this.hasDiscount,
    @required this.oldValue,
    @required this.value,
    @required this.expandedHeight,
    @required this.collapsedHeight,
    @required this.title,
    @required this.heroId,
    @required this.logo,
    this.banner,
  });

  double _getHeaderOpacity(double shrinkOffset) {
    print(shrinkOffset);
    if (shrinkOffset > 57) {
      // X is how much the opacity will decrease
      double x = shrinkOffset - 57;
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
          tag: heroId,
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
            child: ProductDetailsWidget(
              logo: logo,
              heroId: 'N/A',
              description:
                  'Sit voluptatem sint. Sunt quia qui ab natus sequi quo magnam.',
              title: title,
              hasDiscount: hasDiscount,
              oldValue: oldValue,
              value: value,
              discountType: discountType,
              discountValue: discountValue,
            ),
          ),
        ),
        Positioned(
          top: 0,
          height: MediaQuery.of(context).padding.top + 52,
          width: MediaQuery.of(context).size.width,
          child: StatusBarShadowWidget(),
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
                  SizedBox(
                    width: 48,
                  )
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
