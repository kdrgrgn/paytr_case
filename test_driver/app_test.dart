import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Change App', () {
    final userNameField = find.byValueKey('userName');
    final passwordField = find.byValueKey('password');
    final signinButton = find.byValueKey('signin');
    final countryItem = find.byValueKey('AUD');
    final formField = find.byValueKey('changeField');
    final title = find.byValueKey('title');

    FlutterDriver? driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver?.close();
      }
    });

    test('app Integration test', () async {

      sleep(Duration(seconds: 3));

      await driver?.tap(userNameField);
      await driver?.enterText('kadir');
      await driver?.waitFor(find.text('kadir'));

      await driver?.tap(passwordField);
      await driver?.enterText('123123');
      await driver?.waitFor(find.text('123123'));

      await driver?.tap(signinButton);

      await driver?.waitForTappable(countryItem);
      await driver?.tap(countryItem);

      await driver?.tap(formField);
      await driver?.enterText('12.8');
      await driver?.waitFor(find.text('12.8'));

    });
  });
}
