import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kwik_client_flutter/screens/auth/forgotten_password.dart';
import 'package:kwik_client_flutter/screens/auth/login_screen.dart';
import 'package:kwik_client_flutter/screens/cart/cart_order_success_screen.dart';
import 'package:kwik_client_flutter/screens/delivery_request/delivery_request_screen.dart';
import 'package:kwik_client_flutter/screens/delivery_request/request_success_screen.dart';
import 'package:kwik_client_flutter/themes/dark_theme.dart';
import 'package:provider/provider.dart';

import '../../screens/add_edit_address/add_edit_address_screen.dart';
import '../../screens/adresses/adresses_screen.dart';
import '../../screens/auth/auth_screen.dart';
import '../../screens/cart/cart_order_details_screen.dart';
import '../../screens/cart/cart_order_summary_screen.dart';
import '../../screens/coupons/coupons_screen.dart';
import '../../screens/favorites/favorites_screen.dart';
import '../../screens/help/help_screen.dart';
import '../../screens/order_details/order_details_screen.dart';
import '../../screens/product/product_screen.dart';
import '../../screens/rating/rating_screen.dart';
import '../../screens/search/search_screen.dart';
import '../../screens/store/store_screen.dart';
import '../../screens/stores/stores_screen.dart';
import '../../screens/tabbed_main/tabbed_main_screen.dart';
import '../../screens/user_profile/user_profile_screen.dart';
import '../../themes/light_theme.dart';
import 'app_store.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AppStore>(context);
    FirebaseAnalytics analytics = FirebaseAnalytics();
    FirebaseAnalyticsObserver observer =
        FirebaseAnalyticsObserver(analytics: analytics);
    double textScaleFactor = 1.0;
    return Observer(
        builder: (_) => GestureDetector(
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);
                currentFocus.unfocus();

                if (!currentFocus.hasPrimaryFocus &&
                    currentFocus.focusedChild != null) {
                  currentFocus.focusedChild.unfocus();
                }
              },
              child: MaterialApp(
                builder: (BuildContext context, Widget child) {
                  // Disables text resize by OS
                  return MediaQuery(
                    data: MediaQuery.of(context)
                        .copyWith(textScaleFactor: textScaleFactor),
                    child: child,
                  );
                },
                title: 'Kwik',
                navigatorObservers: [
                  observer,
                ],
                theme: store.isDark ? darkTheme : lightTheme,
                debugShowCheckedModeBanner: false,
                initialRoute: '/auth',
                localizationsDelegates: [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                locale: Locale('pt', 'BR'),
                supportedLocales: [const Locale('pt', 'BR')],
                onGenerateRoute: (settings) {
                  switch (settings.name) {
                    case '/':
                      return CupertinoPageRoute(
                          builder: (_) => TabbedMain(
                                analytics: analytics,
                                observer: observer,
                              ),
                          settings: settings);
                    case '/auth':
                      return CupertinoPageRoute(
                        builder: (_) => AuthScreen(),
                        settings: settings,
                      );
                    case '/login':
                      return CupertinoPageRoute(
                        builder: (_) => LoginScreen(),
                        settings: settings,
                      );
                    case '/forgotten-password':
                      return CupertinoPageRoute(
                        builder: (_) => ForgottenPasswordScreen(),
                        settings: settings,
                      );
                    case '/favorites':
                      return CupertinoPageRoute(
                        builder: (_) => FavoritesScreen(),
                        settings: settings,
                      );
                    case '/stores':
                      return CupertinoPageRoute(
                          builder: (_) => StoresScreen(), settings: settings);
                    case '/coupons':
                      return CupertinoPageRoute(
                          builder: (_) => CouponsScreen(), settings: settings);
                    case '/rating':
                      return CupertinoPageRoute(
                          builder: (_) => RatingScreen(), settings: settings);
                    case '/profile':
                      return CupertinoPageRoute(
                          builder: (_) => UserProfileScreen(),
                          settings: settings);
                    case '/adresses':
                      return CupertinoPageRoute(
                          builder: (_) => AdressesScreen(), settings: settings);
                    case '/add-edit-address':
                      return CupertinoPageRoute(
                          builder: (_) => AddEditAddressScreen(),
                          settings: settings);
                    case '/help':
                      return CupertinoPageRoute(
                          builder: (_) => HelpScreen(), settings: settings);
                    case '/order-details':
                      return CupertinoPageRoute(
                          builder: (_) => OrderDetailsScreen(),
                          settings: settings);
                    case '/store':
                      return CupertinoPageRoute(
                          builder: (_) => StoreScreen(), settings: settings);
                    case '/product':
                      return CupertinoPageRoute(
                          builder: (_) => ProductScreen(), settings: settings);
                    case '/search':
                      return CupertinoPageRoute(
                          builder: (_) => SearchScreen(), settings: settings);
                    case '/cart-order-details':
                      return CupertinoPageRoute(
                          builder: (_) => CartOrderDetailsScreen(),
                          settings: settings);
                    case '/order-summary':
                      return CupertinoPageRoute(
                          builder: (_) => CartOrderSummaryScreen(),
                          settings: settings);
                    case '/order-success':
                      return CupertinoPageRoute(
                          builder: (_) => CartOrderSucessScreen(),
                          settings: settings);
                    case '/delivery_request':
                      return CupertinoPageRoute(
                          builder: (_) => DeliveryRequestScreen(),
                          settings: settings);
                    case '/delivery_request_success':
                      return CupertinoPageRoute(
                          builder: (_) => RequestSucessScreen(),
                          settings: settings);
                    default:
                      return CupertinoPageRoute(
                          builder: (_) => TabbedMain(), settings: settings);
                  }
                },
              ),
            ));
  }
}
