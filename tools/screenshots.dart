import 'dart:io';

import 'package:emulators/emulators.dart' as emu;

Future<void> main() async {
  // Create the config instance
  final config = await emu.buildConfig();

  // Shutdown all the running emulators
  await emu.shutdownAll(config);

  // Make sure the Nexus_5X android emulator exists.
  // We use the avdmanager CLI tool for this.
  // You might need to install some packages in Android Studio for this to work.
  await emu.avdmanager(config)([
    'create',
    'avd',
    '-n',
    'Nexus_5X',
    '-k',
    'system-images;android-30;google_apis_playstore;x86',
    '-d',
    'Nexus 5X',
    '-f',
  ]);

  // For each emulator in the list, we run `flutter drive`.
  await emu.forEach(config)([
    'Nexus_5X',
    'iPhone 8 Plus',
    'iPhone 12 Pro',
  ])((device) async {
    final p = await emu.drive(config)(device, 'test_driver/main.dart');
    await stdout.addStream(p.stdout);
  });
}
