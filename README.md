# emulators_demo

A demo project for using the `emulators` package to generate screenshots.

## Usage

1. Make sure you have xcode and Android Studio setup correctly. `flutter doctor`
   should report no issues.
2. Setup flutter project as usual (`flutter pub get` etc).
3. Run `dart tools/screenshots.dart`.

This will update the images in the `screenshots/` directory.

## Files of interest

This example is generated from `flutter create` with no modifications.

The following files were added to make the screenshot generation work:

- `emulators`, `test` and `flutter_driver` dependencies were added to `pubspec.yaml`.
- The `test_driver` directory was added.
- The `tools` directory was added.