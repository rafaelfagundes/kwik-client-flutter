import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:intl/intl.dart';
import 'package:test/test.dart';

void main() {
  group('Testing Kwik Entregas Client App:', () {
    FlutterDriver driver;
    int screenshotCounter = 1;
    String date;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
      date = DateFormat('yyyy-MM-dd hh:mm:ss').format(DateTime.now());
      new Directory('screenshots').create();
      new Directory('screenshots/$date').create();
    });

    tearDownAll(() {
      if (driver != null) {
        driver.close();
      }
    });

    Future<void> takeScreenshot(String name) async {
      final String counter = screenshotCounter.toString().padLeft(3, '0');
      final String path = 'screenshots/$date/$counter. $name.png';
      final List<int> pixels = await driver.screenshot();
      final File file = new File(path);
      await file.writeAsBytes(pixels);
      print(path);
      screenshotCounter++;
    }

    var goBack = find.byType('CupertinoNavigationBarBackButton');

    group('Sign Up -', () {
      test('Tap signup button', () async {
        await takeScreenshot('auth_main');
        var button = find.text('Cadastro Rápido');
        await driver.tap(button);
        await takeScreenshot('sign_up_screen');
      });

      test('Validation test', () async {
        var button = find.byValueKey('signUpButton');
        await driver.tap(button);
        await takeScreenshot('sign_up_validation');
        var validationError = find.text('Por favor, preencha o nome');
        await driver.waitFor(validationError);
        await driver.tap(goBack);
      });
    }, skip: false);

    group('Login -', () {
      test('Got to login screen', () async {
        var button = find.text('Entrar');
        await driver.tap(button);
      });
      test('Validation test', () async {
        await takeScreenshot('login_screen');
        var button = find.byValueKey('enterButton');
        await driver.tap(button);
        await takeScreenshot('login_validation');
      });
      test('Tap login button', () async {
        var button = find.byValueKey('enterButton');
        var emailTextField = find.byValueKey('emailTextField');
        var passwordTextField = find.byValueKey('passwordTextField');

        await driver.tap(emailTextField);
        await driver.enterText('rafael@usuario.com');
        await driver.tap(passwordTextField);
        await driver.enterText('123456');
        await takeScreenshot('login_data');
        await driver.tap(button);
      });
    }, skip: false);

    group('Home -', () {
      test('Searchbar to searchscreen', () async {
        await takeScreenshot('home_screen');
        var searchbar = find.byValueKey('searchBar');
        await driver.tap(searchbar);
        await takeScreenshot('search_screen');
        var searchBackButton = find.byValueKey('searchBackButton');
        await driver.tap(searchBackButton);
      });
    }, skip: false);

    group('Tabbar Screens -', () {
      var orders = find.byValueKey('tabIconOrders');
      var cart = find.byValueKey('tabIconCart');
      var notifications = find.byValueKey('tabIconNotifications');
      var settings = find.byValueKey('tabIconSettings');

      test('Switching screens', () async {
        await driver.tap(orders);
        await takeScreenshot('orders_screen');
        await driver.tap(cart);
        await takeScreenshot('cart_screen');
        await driver.tap(notifications);
        await takeScreenshot('notifications_screen');
        await driver.tap(settings);
        await takeScreenshot('settings_screen');
      });
    }, skip: false);
  });
}
