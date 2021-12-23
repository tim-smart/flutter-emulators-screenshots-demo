import 'package:emulators/emulators.dart' as emu;
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

Future<void> main() async {
  // Connect to flutter driver
  final driver = await FlutterDriver.connect();

  // Setup emulators package
  final config = await emu.buildConfig();
  final screenshot = emu.writeScreenshotFromEnv(config)(
    androidPath: 'screenshots/android',
    iosPath: 'screenshots/ios',
    suffixes: [emu.getString('locale')!],
  );

  setUpAll(() async {
    await driver.waitUntilFirstFrameRasterized();

    // Clean up the status bar for the device
    await emu.cleanStatusBarFromEnv(config);
  });

  // Close the connection to the driver after the tests have completed.
  tearDownAll(() async {
    await driver.close();
  });

  group('Screenshots', () {
    test('home screen', () async {
      await driver.waitFor(find.text('Flutter Demo Home Page'));
      await screenshot('01');
    });

    final buttonFinder = find.byTooltip('Increment');
    test('updated count', () async {
      await driver.tap(buttonFinder);
      await driver.tap(buttonFinder);
      await driver.tap(buttonFinder);
      await driver.waitUntilNoTransientCallbacks();
      await screenshot('02');
    });
  });
}
