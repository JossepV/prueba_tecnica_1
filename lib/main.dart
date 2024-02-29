import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_service.dart';

void main() async {
  final settingsController = SettingsController(SettingsService());
  await settingsController.loadSettings();
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
    SystemUiOverlay.bottom,
    SystemUiOverlay.top,
  ]);

  runApp(MyApp(settingsController: settingsController));
}
