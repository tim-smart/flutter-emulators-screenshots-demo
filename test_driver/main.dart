import 'package:emulators/emulators.dart' as emu;
import 'package:emulators_demo/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';

void main() {
  // Disable the 'debug' banner
  WidgetsApp.debugAllowBannerOverride = false;

  // Enable flutter driver
  enableFlutterDriverExtension();

  final locale = emu.getString('locale');
  print('Device: ${emu.currentDevice()}');
  print('Locale: $locale');

  // Run the app. You could pass in `locale` here.
  runApp(MyApp());
}
