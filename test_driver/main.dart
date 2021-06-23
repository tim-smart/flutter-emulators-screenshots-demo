import 'package:emulators_demo/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';

void main() {
  // Disable the 'debug' banner
  WidgetsApp.debugAllowBannerOverride = false;

  // Enable flutter driver
  enableFlutterDriverExtension();

  // Run the app
  runApp(MyApp());
}
